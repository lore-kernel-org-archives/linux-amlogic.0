From: ben.dooks@codethink.co.uk (Ben Dooks)
Date: Fri, 24 Jun 2016 16:47:08 +0100
Subject: S805 RTC driver
In-Reply-To: <576D43B2.9060404@baylibre.com>
References: <1466713278-24419-1-git-send-email-ben.dooks@codethink.co.uk>
 <576D43B2.9060404@baylibre.com>
Message-ID: <80ede4a5-6d9c-79cd-b022-dce6102e5623@codethink.co.uk>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 24/06/16 15:29, Neil Armstrong wrote:
> On 06/23/2016 10:21 PM, Ben Dooks wrote:
>> This has been sitting in my tree for a while, so I thought
>> it would be a good idea to try and get it moving along and
>> possibly submittied soon.
>>
>> I've not been able to fully test this as I don't have an
>> S805 MMC driver to allow me to boot to a userland on my
>> ODroid-C1 board.
> 
> You could generate a dummy buildroot initramfs loaded in the Image with the RTC tools.

Thanks for the review, will try and send a RFCv2 today.

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius
