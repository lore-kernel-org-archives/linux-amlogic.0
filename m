From: narmstrong@baylibre.com (Neil Armstrong)
Date: Wed, 21 Nov 2018 10:32:34 +0100
Subject: [U-Boot] [PATCH u-boot 17/19] board: amlogic: add support for
 S400 board
In-Reply-To: <9e6017fc-3d51-5f81-c475-0b95d8be7204@suse.de>
References: <1541777218-472-1-git-send-email-narmstrong@baylibre.com>
 <1541777218-472-18-git-send-email-narmstrong@baylibre.com>
 <9e6017fc-3d51-5f81-c475-0b95d8be7204@suse.de>
Message-ID: <ff17e112-5861-dd01-f0db-4173475138b0@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Loic,

On 20/11/2018 22:08, Loic Devulder wrote:
> Hi Neil,
> 
> On 11/9/18 4:26 PM, Neil Armstrong wrote:
>> The S400 board is the Amlogic AXG SoC reference board including :
>>  - Amlogic A113DX ARM Cortex-A53 quad-core SoC @ 1.2GHz
>>  - 1GB DDR4 SDRAM
>>  - 10/100 Ethernet
>>  - 2 x USB 2.0 Host
>>  - eMMC
>>  - Infrared receiver
>>  - SDIO WiFi Module
>>  - MIPI DSI Connector
>>  - Audio HAT Connector
>>  - PCI-E M.2 Connectors
>>
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>> ---

[...]

>> +
>> + > $FIPDIR/axg/aml_encrypt_axg --bl3sig --input fip/bl30_new.bin \
>> +	 				--output fip/bl30_new.bin.enc \
> 
> I have a git warning because there is a white space between two tabs in
> that line.
> 
>> +					--level v3 --type bl30
>> + > $FIPDIR/axg/aml_encrypt_axg --bl3sig --input fip/bl31.img \
>> +	 				--output fip/bl31.img.enc \
> 
> Same here :)
> 
>> +					--level v3 --type bl31
>> + > $FIPDIR/axg/aml_encrypt_axg --bl3sig --input fip/bl33.bin --compress lz4 \
>> +	 				--output fip/bl33.bin.enc \
> 
> Same here :)
>> +					--level v3 --type bl33
>> + > $FIPDIR/axg/aml_encrypt_axg --bl2sig --input fip/bl2_new.bin \
>> +	 				--output fip/bl2.n.bin.sig
> 
> And same here :) (the last!)
> 
>> + > $FIPDIR/axg/aml_encrypt_axg --bootmk \
>> +		--output fip/u-boot.bin \
>> +		--bl2 fip/bl2.n.bin.sig \
>> +		--bl30 fip/bl30_new.bin.enc \
>> +		--bl31 fip/bl31.img.enc \
>> +		--bl33 fip/bl33.bin.enc --level v3
>> +

[...]

Will fix all these, thanks !

Neil

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 819 bytes
Desc: OpenPGP digital signature
URL: <http://lists.infradead.org/pipermail/linux-amlogic/attachments/20181121/8f8a260a/attachment.sig>
