import { ComponentFixture, TestBed } from '@angular/core/testing';

import { PrikazFilmaComponent } from './prikaz-filma.component';

describe('PrikazFilmaComponent', () => {
  let component: PrikazFilmaComponent;
  let fixture: ComponentFixture<PrikazFilmaComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ PrikazFilmaComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(PrikazFilmaComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
