//
//  scene.cpp
//  MyApp
//
//  Created by EDZ on 2018/6/27.
//  Copyright © 2018年 EDZ. All rights reserved.
//

#include "scene.hpp"
void drawQuard();
void drawTrai();


void scene_init()
{
    glMatrixMode(GL_PROJECTION);
    gluPerspective(50.0f, 800.0f / 600.0f, -1.0f, 1000.0f);
    glMatrixMode(GL_MODELVIEW);
    glLoadIdentity();
}

void scene_draw()
{
    glClearColor(30.0/255.0, 30.0/255.0, 30.0/255.0, 1.0);
    glClear(GL_COLOR_BUFFER_BIT);

    glLoadIdentity();
    glBegin(GL_LINES);
    
    glColor3f(1.0, 0.0, 0.0);glVertex3f(-1.0f, 0.0, 0.0);
    glColor3f(1.0, 0.0, 0.0);glVertex3f(1.0f, 0.0, 0.0);
    glColor3f(1.0, 1.0, 0.0);glVertex3f(0.0f, -1.0, 0.0);
    glColor3f(1.0, 1.0, 0.0);glVertex3f(0.0f, 1.0, 0.0);
    
    glEnd();
    
    
    glLoadIdentity();
    glTranslated(0.0, 0.0, 0.0);
    
    glBegin(GL_TRIANGLES);
    glColor3f(1.0, 0.0, 0.0);glVertex3f(0.5f, 0.0, 0.0);
    glColor3f(1.0, 0.0, 0.0);glVertex3f(-0.5f, 0.0, 0.0);
    glColor3f(1.0, 0.0, 0.0);glVertex3f(0.0f, 0.5, 0.0);
    glEnd();
    
    glLoadIdentity();
    
    glPushMatrix();
    glRotated(30.0, 0.0, 0.0, 1.0);
    glPushMatrix();
    glTranslated(0.5, 0.0, 0.0);
    
    glBegin(GL_TRIANGLES);
    glColor3f(0.0, 1.0, 0.0);glVertex3f(0.5f, 0.0, 0.0);
    glColor3f(0.0, 1.0, 0.0);glVertex3f(-0.5f, 0.0, 0.0);
    glColor3f(0.0, 1.0, 0.0);glVertex3f(0.0f, 0.5, 0.0);
    glEnd();
    
    glPopMatrix();
    glPopMatrix();
}

void drawQuard()
{
    glBegin(GL_QUADS);
    glColor4ub(255, 255, 255, 255);
    glVertex3f(-0.5f, -0.2f, -0.5f);
    glVertex3f(0.5f, -0.2f, -0.5f);
    glVertex3f(0.5f, -0.2f, -1.0f);
    glVertex3f(-0.5f, -0.2f, -1.0f);
    glEnd();
}

void drawTrai()
{

    glLoadIdentity();
    glBegin(GL_LINES);
    
    glColor3f(1.0, 0.0, 0.0);glVertex3f(-1.0f, 0.0, 0.0);
    glColor3f(1.0, 0.0, 0.0);glVertex3f(1.0f, 0.0, 0.0);
    glColor3f(1.0, 1.0, 0.0);glVertex3f(0.0f, -1.0, 0.0);
    glColor3f(1.0, 1.0, 0.0);glVertex3f(0.0f, 1.0, 0.0);
    
    glEnd();
    
    
    glLoadIdentity();
    glTranslated(0.0, 0.0, 0.0);
    
    glBegin(GL_TRIANGLES);
    glColor3f(1.0, 0.0, 0.0);glVertex3f(0.5f, 0.0, 0.0);
    glColor3f(1.0, 0.0, 0.0);glVertex3f(-0.5f, 0.0, 0.0);
    glColor3f(1.0, 0.0, 0.0);glVertex3f(0.0f, 0.5, 0.0);
    glEnd();
    
    glLoadIdentity();
    
    glPushMatrix();
    glRotated(30.0, 0.0, 0.0, 1.0);
    glPushMatrix();
    glTranslated(0.5, 0.0, 0.0);
    
    glBegin(GL_TRIANGLES);
    glColor3f(0.0, 1.0, 0.0);glVertex3f(0.5f, 0.0, 0.0);
    glColor3f(0.0, 1.0, 0.0);glVertex3f(-0.5f, 0.0, 0.0);
    glColor3f(0.0, 1.0, 0.0);glVertex3f(0.0f, 0.5, 0.0);
    glEnd();
    
    glPopMatrix();
    glPopMatrix();
}
