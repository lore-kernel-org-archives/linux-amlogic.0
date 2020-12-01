Return-Path: <SRS0=AMvF=FF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09F6CC64E7A
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Dec 2020 08:52:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 063FF2067D
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Dec 2020 08:52:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cw9fxWwc";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=agner.ch header.i=@agner.ch header.b="HyZ5RtOi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 063FF2067D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=agner.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=G4KeV9rt9z+711WMNAGMIzM3basXwtuy4VuJK02YkAw=; b=cw9fxWwcYWAdpPmiEbGwqVCYA
	ZLs4iw/Q/gdwYU/cYo/SzcqcUAcsY3rDUF0qguw/5M2TZWDi5OUF/5otWMt7nTbULW7mHaFbj6xKs
	/kb1ifrxzGAN1RLr6iWoM1h0WQlHZok9PUcfBHbA1P5TM3OpeLspjUAyARseNz333MTYVhUg9V4gB
	33Iunj1bouufVvayrGIoyz4/Dio4GXwEf4DB2gHtsPgIsONvlk8gM9XwxmWvdJ7O2yXiUJ7pf30Q8
	BCpbuuqHRKZ4AziGrnIwQkhkrsLX0L3XNgmdXHzHBP0gBu1QjqAlDKsuHL0YJMnwlixIl127B48RM
	wvamhgWeg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kk1Og-0007ey-NL; Tue, 01 Dec 2020 08:52:30 +0000
Received: from mail.kmu-office.ch ([2a02:418:6a02::a2])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kk1Od-0007eS-67; Tue, 01 Dec 2020 08:52:28 +0000
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id ADAB25C0930;
 Tue,  1 Dec 2020 09:52:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
 t=1606812744;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vZodXyawqfmhzApkl+PJz1fcLX5uRiTYHumDpkFd5hs=;
 b=HyZ5RtOinN2JFcNOxIy7mUwszPE8yBz2bTjXwSg7YI9AYhS48fwqgF7k63oSRljnqgXwaZ
 yDM7I0Ezu53i6IXgVoVE0eZFMFMFkcQymy1HHV3Sqee1tAq8d9Kxj0U3OKt6BrFtW0+VOT
 JtZ84kbZotnZ6EBMS1pT37Hz4VDeoMw=
MIME-Version: 1.0
Date: Tue, 01 Dec 2020 09:52:24 +0100
From: Stefan Agner <stefan@agner.ch>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH] arm64: dts: meson: fix PHY deassert timing requirements
In-Reply-To: <1j8sai7wr0.fsf@starbuckisacylon.baylibre.com>
References: <e4df74aed2a7cff09366e72c87d408f41317907f.1606782187.git.stefan@agner.ch>
 <1j8sai7wr0.fsf@starbuckisacylon.baylibre.com>
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <fd174decc948aa7a9c8cf62d23371480@agner.ch>
X-Sender: stefan@agner.ch
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201201_035227_492571_DB6E5C2B 
X-CRM114-Status: GOOD (  22.06  )
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
Cc: devicetree@vger.kernel.org, narmstrong@baylibre.com,
 martin.blumenstingl@googlemail.com, khilman@baylibre.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 2020-12-01 09:31, Jerome Brunet wrote:
> On Tue 01 Dec 2020 at 01:25, Stefan Agner <stefan@agner.ch> wrote:
> 
>> According to the datasheet (Rev. 1.4, page 30) the RTL8211F requires
>> at least 50ms "for internal circuits settling time" before accessing
>> the PHY registers. This fixes an issue where the Ethernet link doesn't
>> come up when using ip link set down/up:
>>   [   29.360965] meson8b-dwmac ff3f0000.ethernet eth0: Link is Down
>>   [   34.569012] meson8b-dwmac ff3f0000.ethernet eth0: PHY [0.0:00] driver [RTL8211F Gigabit Ethernet] (irq=31)
>>   [   34.676732] meson8b-dwmac ff3f0000.ethernet: Failed to reset the dma
>>   [   34.678874] meson8b-dwmac ff3f0000.ethernet eth0: stmmac_hw_setup: DMA engine initialization failed
>>   [   34.687850] meson8b-dwmac ff3f0000.ethernet eth0: stmmac_open: Hw setup failed
>>
>> Fixes: 658e4129bb81 ("arm64: dts: meson: g12b: odroid-n2: add the Ethernet PHY reset line")
>> Signed-off-by: Stefan Agner <stefan@agner.ch>
>> ---
>>  arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
>> index 6982632ae646..a5652caacb27 100644
>> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
>> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
>> @@ -413,7 +413,7 @@ external_phy: ethernet-phy@0 {
>>  		max-speed = <1000>;
>>
>>  		reset-assert-us = <10000>;
>> -		reset-deassert-us = <30000>;
>> +		reset-deassert-us = <50000>;
>>  		reset-gpios = <&gpio GPIOZ_15 (GPIO_ACTIVE_LOW | GPIO_OPEN_DRAIN)>;
>>
>>  		interrupt-parent = <&gpio_intc>;
> 
> Thanks for sharing this is Stefan,
> The title of your patch should probably be modified to show that it
> addresses the odroid n2 only, as it stands.

Yes make sense. Hm, are there other boards with RTL8211F? From the
comments in the DT it seems several other boards use the same PHY. Some
however do not have any reset timing data at all currently it seems.

> 
> I have checked the RTL8211F doc I have, v1.9, and this one mention
> "72ms at least - not including the 1.0V supply rise time" before
> accessing the PHY registers :/ ... so 80ms maybe ?

Uh interesting, so it seems they increased it over documentation
revisions. Yeah agreed 80ms is the safer value then.

FWIW, I did test it with 50ms in a continuous loop for an hour or so
without seeing any failure, but that was room temperature only.

--
Stefan

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
