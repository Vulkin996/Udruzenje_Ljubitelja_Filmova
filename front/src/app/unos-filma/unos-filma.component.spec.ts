import { ComponentFixture, TestBed } from '@angular/core/testing';

import { UnosFilmaComponent } from './unos-filma.component';

describe('UnosFilmaComponent', () => {
  let component: UnosFilmaComponent;
  let fixture: ComponentFixture<UnosFilmaComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ UnosFilmaComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(UnosFilmaComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
