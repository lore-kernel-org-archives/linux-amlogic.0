Return-Path: <SRS0=7XO7=FY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DD6FC4361B
	for <linux-amlogic@archiver.kernel.org>; Sun, 20 Dec 2020 10:28:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C4FFF22D50
	for <linux-amlogic@archiver.kernel.org>; Sun, 20 Dec 2020 10:28:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C4FFF22D50
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0jo3p7psdNHwiXJOE4b9EBVFocX5zN4vDeFGHrhrHz0=; b=tKHZJuvC0MX7g6cHT5TICdeR/
	vFqORvrRhxeocR08Mj9g621KDVgeY3Ml/Gi9ghD93U07EAcTx7uBO0PXnKgEKx7QpvPy5g7330co7
	46wjbttqmk50fGKGHjBYOQGjVZsvSPA0BkRmmf9nn3MfxSfA4gXKtz4GAo9vN7C3qPsdxifotTtvE
	O6y6iMbGPcGZfSsUZ6FocOMwOFm3mkvtk370UBmTLpqU7QmKR/YxpLbgZ961K1cB/vTVStbqwlwhh
	xilBH1nKG287bWG2DhpkJ8Wn2WgBs1chC3whd4iHSDpsyUSih4n0gJ9mhbx4nfd2tGpJj7GvJeebv
	et4zxS/Vw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kqvx5-0002Iu-3d; Sun, 20 Dec 2020 10:28:35 +0000
Received: from dd10532.kasserver.com ([85.13.133.80])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kqvx2-0002IR-3s
 for linux-amlogic@lists.infradead.org; Sun, 20 Dec 2020 10:28:33 +0000
Received: from odsus.home.arpa
 (dslb-002-204-168-073.002.204.pools.vodafone-ip.de [2.204.168.73])
 by dd10532.kasserver.com (Postfix) with ESMTPSA id 75FF21F417C0;
 Sun, 20 Dec 2020 11:28:26 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by odsus.home.arpa (Postfix) with ESMTP id 0C5893D671;
 Sun, 20 Dec 2020 11:28:26 +0100 (CET)
X-Virus-Scanned: amavisd-new at home.arpa
Received: from odsus.home.arpa ([127.0.0.1])
 by localhost (odsus.home.arpa [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5IMwwEjDlgbf; Sun, 20 Dec 2020 11:28:24 +0100 (CET)
Received: from [192.168.20.240] (r64.home.arpa [192.168.20.240])
 by odsus.home.arpa (Postfix) with ESMTP id 183353D66F;
 Sun, 20 Dec 2020 11:28:24 +0100 (CET)
Subject: Re: [BUG]odroid-c2 does not hotplug usb-devices
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Anand Moon <linux.amoon@gmail.com>
References: <c2dc3507-67a7-3c18-374f-050295bc1d59@gmx.net>
 <CAFBinCDrMj4GP2cy4dBSt_isGXf4CuhmDz=uAs+gZwUGQc=o6A@mail.gmail.com>
 <8afb2adb-4581-a847-e7e0-db1e915e9247@gmx.net>
 <CAFBinCD6aqna6YYvXgO5iKWa9N3yvqehhB+SAirLaUu3xScy2Q@mail.gmail.com>
 <bd9d96d2-8b66-db93-a855-5e179adca8c9@gmx.net>
 <0d05671d-b5f4-55e4-f5bd-58410cc92d08@baylibre.com>
 <dd160e55-55e9-1c41-afcb-22990a05a86b@gmx.net>
 <CAFBinCDv+TgEgf1g7xBTknr-aJMhC3K1wOW87-06YG4sQ9wUAg@mail.gmail.com>
 <531138bc-d343-1081-d208-ab6c98c1ddd8@gmx.net>
 <CAFBinCBoWGV02hF=0DK_geLpArDtm-qbAKCrXQitpb33UU_zYA@mail.gmail.com>
 <CANAwSgQuZbH_E7Kaxycu0vkTxzL-XqC3PneGKM3PpaPvwDQgDg@mail.gmail.com>
 <CAFBinCDaT_z_+bbQ-LaSc56wuWLPmr6kz-2aYowCnQwN9VNqUw@mail.gmail.com>
From: Otto Meier <gf435@gmx.net>
Message-ID: <0844051e-c44c-c2b7-dcb3-2e16b6b27e99@gmx.net>
Date: Sun, 20 Dec 2020 11:28:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <CAFBinCDaT_z_+bbQ-LaSc56wuWLPmr6kz-2aYowCnQwN9VNqUw@mail.gmail.com>
Content-Language: de-DE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201220_052832_368891_961F45E8 
X-CRM114-Status: GOOD (  30.77  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: U-Boot Mailing List <u-boot@lists.denx.de>,
 linux-amlogic@lists.infradead.org, u-boot-amlogic@groups.io,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Martin,

i think the the u-boot fix made the new u-boot for me usable.
Because i boot from emmc it fixes a long standing problem since 2020.04
in not booting from emmc.
The latest uboot, booting from emmc before the fix was 2020.04, but this 
old uboot does not funktion well
(hotpluging and others) with newer kernel (5.8.10 was the latest i new 
of). Therefore
the latest Uboot initialized the kernel in a way that new kernels work 
again.

I haven't run kernel in between, with newer uboots like 2020.07 or 
2020.10, because they din't boot
from emmc.

so if the uboot patch is the real reason, i don't think.

best regrads

Otto

Am 19.12.20 um 23:31 schrieb Martin Blumenstingl:
> Hi Anand,
>
> On Sat, Dec 19, 2020 at 8:53 PM Anand Moon <linux.amoon@gmail.com> wrote:
> [...]
>> I was also looking into this issue so I made some changes in the
>> phy driver to resolve the issue. Plz share your thoughts on the changes below.
> first I have some questions :-)
> 1. do you see the same problem that Otto sees? this means: a) USB
> hotplug works as long as at least one device is plugged in at boot b)
> (if I understand Otto correctly then) it breaks once all USB devices
> have been removed
> 2. does the mainline u-boot patch mentioned by Otto fix the problem
> for you? according to him it fixes the problem and he did not have to
> modify the USB PHY driver
>
>> amoon@ThinkPad-T440s:~/mainline/linux-aml-5.y-devel$ git diff
>> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
>> b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
>> index 7c029f552a23..363dd2ac17e6 100644
>> --- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
>> +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
>> @@ -20,6 +20,7 @@ usb0_phy: phy@c0000000 {
>>                          #phy-cells = <0>;
>>                          reg = <0x0 0xc0000000 0x0 0x20>;
>>                          resets = <&reset RESET_USB_OTG>;
>> +                       reset-names = "phy-reset";
>>                          clocks = <&clkc CLKID_USB>, <&clkc CLKID_USB0>;
>>                          clock-names = "usb_general", "usb";
>>                          status = "disabled";
>> @@ -30,6 +31,7 @@ usb1_phy: phy@c0000020 {
>>                          #phy-cells = <0>;
>>                          reg = <0x0 0xc0000020 0x0 0x20>;
>>                          resets = <&reset RESET_USB_OTG>;
>> +                       reset-names = "phy-reset";
>>                          clocks = <&clkc CLKID_USB>, <&clkc CLKID_USB1>;
>>                          clock-names = "usb_general", "usb";
>>                          status = "disabled";
> I don't see why the above two changes are needed
> see my comment about of_reset_control_get_shared below
>
>> diff --git a/drivers/phy/amlogic/phy-meson8b-usb2.c
>> b/drivers/phy/amlogic/phy-meson8b-usb2.c
>> index 03c061dd5f0d..31523becc878 100644
>> --- a/drivers/phy/amlogic/phy-meson8b-usb2.c
>> +++ b/drivers/phy/amlogic/phy-meson8b-usb2.c
>> @@ -143,14 +143,6 @@ static int phy_meson8b_usb2_power_on(struct phy *phy)
>>          u32 reg;
>>          int ret;
>>
>> -       if (!IS_ERR_OR_NULL(priv->reset)) {
>> -               ret = reset_control_reset(priv->reset);
>> -               if (ret) {
>> -                       dev_err(&phy->dev, "Failed to trigger USB reset\n");
>> -                       return ret;
>> -               }
>> -       }
>> -
>>          ret = clk_prepare_enable(priv->clk_usb_general);
>>          if (ret) {
>>                  dev_err(&phy->dev, "Failed to enable USB general clock\n");
>> @@ -222,9 +214,23 @@ static int phy_meson8b_usb2_power_off(struct phy *phy)
>>          return 0;
>>   }
>>
>> +static int phy_meson8b_usb2_reset(struct phy *phy)
>> +{
>> +       struct phy_meson8b_usb2_priv *priv = phy_get_drvdata(phy);
>> +
>> +       if (priv->reset) {
>> +               reset_control_assert(priv->reset);
>> +               udelay(10);
>> +               reset_control_deassert(priv->reset);
>> +       }
>> +
>> +       return 0;
>> +}
>> +
>>   static const struct phy_ops phy_meson8b_usb2_ops = {
>>          .power_on       = phy_meson8b_usb2_power_on,
>>          .power_off      = phy_meson8b_usb2_power_off,
>> +       .reset          = phy_meson8b_usb2_reset,
>>          .owner          = THIS_MODULE,
>>   };
> I tested this on my Odroid-C1: phy_meson8b_usb2_reset is never called
> after checking the dwc2 code this is expected: only in one very
> specific case the dwc2 driver calls phy_reset
> can you please find out how phy_meson8b_usb2_reset is called in your kernel?
>
>> @@ -271,6 +277,10 @@ static int phy_meson8b_usb2_probe(struct
>> platform_device *pdev)
>>                  return -EINVAL;
>>          }
>>
>> +       priv->reset = of_reset_control_get_shared(pdev->dev.of_node,
>> "phy-reset");
> this causes a memory-leak upon driver removal
> also a few lines above we are already getting the reset line, so why
> is this needed?
>
>
> Best regards,
> Martin
>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
