From: narmstrong@baylibre.com (Neil Armstrong)
Date: Thu, 22 Nov 2018 09:21:22 +0100
Subject: [U-Boot] [PATCH u-boot v3 0/3] Add Amlogic Meson SPI Flash
 Controller driver
In-Reply-To: <CAMty3ZAQOdxjTttfCFA4hnZzgEX9cgijZrmdcxHXnkka+uNusQ@mail.gmail.com>
References: <20181114102520.25346-1-narmstrong@baylibre.com>
 <CAMty3ZAQOdxjTttfCFA4hnZzgEX9cgijZrmdcxHXnkka+uNusQ@mail.gmail.com>
Message-ID: <0f324d94-c851-caec-eb77-c23418e5264f@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 22/11/2018 07:40, Jagan Teki wrote:
> On Wed, Nov 14, 2018 at 3:55 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>>
>> The Amlogic Meson SoCs embeds a Flash oriented SPI Controller name SPIFC.
>>
>> This patchset add the driver ported from linux, but also import the regmap
>> regmap_read_poll_timeout() to implify the register polling in the driver.
>>
>> Neil Armstrong (3):
>>   regmap: add regmap_read_poll_timeout() helper
>>   test: regmap: add regmap_read_poll_timeout test
>>   spi: Add Amlogic Meson SPI Flash Controller driver
> 
> There are few regmap patches upstreamed recently, can you rebase and
> the send the series again. take care of direct poll_timeout w/o any
> function on driver.
> 

Sure,

Neil
