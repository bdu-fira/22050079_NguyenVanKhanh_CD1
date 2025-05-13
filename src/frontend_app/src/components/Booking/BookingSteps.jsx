export default function BookingSteps({ currentStep }) {
    const steps = [
      { id: 1, name: 'Thông tin' },
      { id: 2, name: 'Chọn bàn' },
      { id: 3, name: 'Chọn món' },
      { id: 4, name: 'Thanh toán' },

    ];
  
    return (
      <div className="flex justify-center mb-8">
        {steps.map((step) => (
          <div key={step.id} className={`px-4 py-2 mx-1 border-b-2 ${
            currentStep >= step.id 
              ? 'border-amber-500 text-amber-600 font-medium' 
              : 'border-gray-200 text-gray-400'
          }`}>
            {step.name}
          </div>
        ))}
      </div>
    );
  }