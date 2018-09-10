//
//  LTDramImageViewController.m
//  leverTsui-OpenGL
//
//  Created by xulihua on 2018/9/10.
//  Copyright © 2018年 huage. All rights reserved.
//

#import "LTDramImageViewController.h"
#import <GLKit/GLKit.h>
#import <Masonry/Masonry.h>

@interface LTDramImageViewController ()<GLKViewDelegate>

@property (nonatomic, strong) GLKView *glView;

@property (nonatomic, strong) EAGLContext* mContext;

@property (nonatomic, strong) GLKBaseEffect* mEffect;

@end

@implementation LTDramImageViewController


#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self configurePageView];
    [self addPageSubviews];
    [self layoutPageSubviews];
    [self uploadVertexArray];
    [self uploadTexture];
}

#pragma mark - UI & autolayout

- (void)addPageSubviews {
    [self.view addSubview:self.glView];
}

- (void)layoutPageSubviews {
    [self.glView mas_makeConstraints:^(MASConstraintMaker *make) {
        if (@available(iOS 11.0, *)) {
            make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop);
            make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom);
        } else {
            make.top.equalTo(self.view);
            make.bottom.equalTo(self.view);
        }
        make.leading.equalTo(self.view);
        make.trailing.equalTo(self.view);
    }];
}

- (void)configurePageView {
    self.view.backgroundColor = [UIColor whiteColor];
    [EAGLContext setCurrentContext:self.mContext];
}
    

#pragma mark - GLKViewDelegate

- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect {
    
    glClearColor(0.3f, 0.6f, 1.0f, 1.0f);
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
    
    //启动着色器
    [self.mEffect prepareToDraw];
    glDrawArrays(GL_TRIANGLES, 0, 6);
}

#pragma mark - private method

- (void)uploadVertexArray {
    //顶点数据，前三个是顶点坐标（x、y、z轴），后面两个是纹理坐标（x，y）
    GLfloat vertexData[] =
    {
        0.5, -0.5, 0.0f,    1.0f, 0.0f, //右下
        0.5, 0.5, -0.0f,    1.0f, 1.0f, //右上
        -0.5, 0.5, 0.0f,    0.0f, 1.0f, //左上
        
        0.5, -0.5, 0.0f,    1.0f, 0.0f, //右下
        -0.5, 0.5, 0.0f,    0.0f, 1.0f, //左上
        -0.5, -0.5, 0.0f,   0.0f, 0.0f, //左下
    };
    
    /*
     * 1、glGenBuffers申请一个标识符
     * 2、glBindBuffer把标识符绑定到GL_ARRAY_BUFFER上
     * 3、glBufferData把顶点数据从cpu内存复制到gpu内存
     * 4、glEnableVertexAttribArray 是开启对应的顶点属性
     * 5、glVertexAttribPointer设置合适的格式从buffer里面读取数据
     */
    
    //顶点数据缓存
    GLuint buffer;
    glGenBuffers(1, &buffer);
    glBindBuffer(GL_ARRAY_BUFFER, buffer);
    glBufferData(GL_ARRAY_BUFFER, sizeof(vertexData), vertexData, GL_STATIC_DRAW);
    
    glEnableVertexAttribArray(GLKVertexAttribPosition); //顶点数据缓存
    glVertexAttribPointer(GLKVertexAttribPosition, 3, GL_FLOAT, GL_FALSE, sizeof(GLfloat) * 5, (GLfloat *)NULL + 0);
    glEnableVertexAttribArray(GLKVertexAttribTexCoord0); //纹理
    glVertexAttribPointer(GLKVertexAttribTexCoord0, 2, GL_FLOAT, GL_FALSE, sizeof(GLfloat) * 5, (GLfloat *)NULL + 3);
}

//纹理贴图
- (void)uploadTexture {
    
    /*
     * 1、GLKTextureLoader读取图片，创建纹理GLKTextureInfo
     * 2、创建着色器GLKBaseEffect，把纹理赋值给着色器
     */
    
    NSString* filePath = [[NSBundle mainBundle] pathForResource:@"1" ofType:@"jpeg"];
    NSDictionary* options = [NSDictionary dictionaryWithObjectsAndKeys:@(1), GLKTextureLoaderOriginBottomLeft, nil];//GLKTextureLoaderOriginBottomLeft 纹理坐标系是相反的
    GLKTextureInfo* textureInfo = [GLKTextureLoader textureWithContentsOfFile:filePath options:options error:nil];
    self.mEffect.texture2d0.name = textureInfo.name;
}

#pragma mark - getter & setter

- (EAGLContext *)mContext {
    if (!_mContext) {
        _mContext = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2]; //2.0，还有1.0和3.0
    }
    return _mContext;
}

- (GLKView *)glView {
    if (!_glView) {
        _glView = [[GLKView alloc] initWithFrame:CGRectZero context:self.mContext];
        _glView.delegate = self;
        _glView.drawableColorFormat = GLKViewDrawableColorFormatRGBA8888;  //颜色缓冲区格式
    }
    return _glView;
}

//着色器
- (GLKBaseEffect *)mEffect {
    if (!_mEffect) {
        _mEffect = [[GLKBaseEffect alloc] init];
        _mEffect.texture2d0.enabled = GL_TRUE;
    }
    return _mEffect;
}

@end
