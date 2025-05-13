// src/hooks/useRipple.js
import { useEffect } from 'react';

const useRipple = (ref) => {
  useEffect(() => {
    const element = ref.current;
    if (!element) return;

    const createRipple = (e) => {
      const circle = document.createElement('div');
      const diameter = Math.max(element.clientWidth, element.clientHeight);
      const radius = diameter / 2;

      circle.style.width = circle.style.height = `${diameter}px`;
      circle.style.left = `${e.clientX - element.getBoundingClientRect().left - radius}px`;
      circle.style.top = `${e.clientY - element.getBoundingClientRect().top - radius}px`;
      circle.classList.add('ripple');

      element.appendChild(circle);

      setTimeout(() => circle.remove(), 600);
    };

    element.addEventListener('click', createRipple);
    return () => element.removeEventListener('click', createRipple);
  }, [ref]);
};

export default useRipple;