From: narmstrong@baylibre.com (Neil Armstrong)
Date: Thu, 8 Sep 2016 15:00:58 +0200
Subject: [PATCH 2/7] usb: dwc2: add support for Meson8b and GXBB SoCs
In-Reply-To: <0b42cbc0-1d69-bcfd-1a82-9bbb6242cd08@synopsys.com>
References: <20160904213152.25837-1-martin.blumenstingl@googlemail.com>
 <20160904213152.25837-3-martin.blumenstingl@googlemail.com>
 <0b42cbc0-1d69-bcfd-1a82-9bbb6242cd08@synopsys.com>
Message-ID: <af1b2b39-f3b6-470d-af9d-ca3cde6e1e51@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 09/07/2016 11:04 PM, John Youn wrote:
> On 9/4/2016 2:32 PM, Martin Blumenstingl wrote:
>> From: Jerome Brunet <jbrunet@baylibre.com>
>>
>> Add compatible strings for amlogic Meson8b and GXBB SoCs with the
>> corresponding configuration parameters.
>>
>> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> ---
>>  Documentation/devicetree/bindings/usb/dwc2.txt |  2 ++
>>  drivers/usb/dwc2/platform.c                    | 34 ++++++++++++++++++++++++++
>>  2 files changed, 36 insertions(+)
>>
[...]

Hi John,

> Hi,
> 
> I have a patch series in the works that deprecates the usage of these
> static parameters in favor of devicetree properties. I'll try to push
> it out soon. I would rather not see any more static params structures
> in the driver so hopefully we can make it work for your platform.

When do you plan of pushing this series ?

Regards,
Neil
