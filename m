Return-Path: <SRS0=B07/=EO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F16D4C56202
	for <linux-amlogic@archiver.kernel.org>; Sun,  8 Nov 2020 13:14:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F7AB206F4
	for <linux-amlogic@archiver.kernel.org>; Sun,  8 Nov 2020 13:14:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="D/BxCPM5";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="RGDHz/r6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F7AB206F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=29/MCzN/d1KqfX3CHbi2inkf/do2J0AB5gCgSYlJcBI=; b=D/BxCPM5aGZ3ul65FtxIfB/pm
	r/gwJFbYoLpg2ad+E6OBC5Eia+sIkrihWp+hAdYyAQd+jrBkezNK2Zaws+se7khSzrgTCSBM1TN2v
	IoB9pP290hmmrPtLQELUV6eTKyl4wDJP55vBLSv5ixZvEssR4u5+PGdJCnhJMJTSUZ1i+3AbGseEn
	9uq65Ipv9bVIPoW2WtwCq45Bq6bzJcv8V7ZCRKIPHbtmXBvvNlAfr41cTZas6hGAeDl46hPatkPpR
	s6d+6vPGSfUoyWp5ZD9gVHSk05PX4iXtic14U+UYBcSG2As+CQprZC5Y8IG9se9uzUYUezXpUOBZ8
	XhqunVd4Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kbkWd-0006nz-0W; Sun, 08 Nov 2020 13:14:31 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kbkWa-0006nR-8v; Sun, 08 Nov 2020 13:14:29 +0000
Received: from localhost (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5A978206ED;
 Sun,  8 Nov 2020 13:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604841267;
 bh=AJ+N1/3ZhM0QD7AR+VJPiydrjOBZSwlBVgPruD6V/2E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RGDHz/r6S0R7fbH6KEwQyDc5p2UcNE/W2EObG1st5Jtb4J2QziUUJRAhOoxjPW5/7
 l73CHp3DGf5gxu3YvWnFBlRKUOM2AuEJVFeIoRRt/kmFGmeGszBMC5n2oQDZLdmuqT
 a8YDEAhvuyM8ER3PRfeZwHgN80x6dggWb6pwzLe0=
Date: Sun, 8 Nov 2020 08:14:26 -0500
From: Sasha Levin <sashal@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH AUTOSEL 5.9 03/35] arm64: dts: meson-axg-s400: enable USB
 OTG
Message-ID: <20201108131426.GP2092@sasha-vm>
References: <20201103011840.182814-1-sashal@kernel.org>
 <20201103011840.182814-3-sashal@kernel.org>
 <c8951cc9-1a3f-2eb2-52fe-654d49591c7a@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c8951cc9-1a3f-2eb2-52fe-654d49591c7a@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201108_081428_861032_A490C856 
X-CRM114-Status: GOOD (  14.71  )
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
Cc: devicetree@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, Nov 03, 2020 at 09:55:51AM +0100, Neil Armstrong wrote:
>On 03/11/2020 02:18, Sasha Levin wrote:
>> From: Neil Armstrong <narmstrong@baylibre.com>
>>
>> [ Upstream commit f450d2c219f6a6b79880c97bf910c3c72725eb70 ]
>>
>> This enables USB OTG on the S400 board.
>>
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>> Reviewed-by: Kevin Hilman <khilman@baylibre.com>
>> Signed-off-by: Kevin Hilman <khilman@baylibre.com>
>> Signed-off-by: Sasha Levin <sashal@kernel.org>
>> ---
>>  arch/arm64/boot/dts/amlogic/meson-axg-s400.dts | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
>> index cb1360ae1211e..7740f97c240f0 100644
>> --- a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
>> +++ b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
>> @@ -584,3 +584,9 @@ &uart_AO {
>>  	pinctrl-0 = <&uart_ao_a_pins>;
>>  	pinctrl-names = "default";
>>  };
>> +
>> +&usb {
>> +	status = "okay";
>> +	dr_mode = "otg";
>> +	vbus-supply = <&usb_pwr>;
>> +};
>>
>
>Hi Sasha,
>
>This needs also support in the dwc3-meson-g12a driver, you can drop it from backport.

Dropped, thanks!

-- 
Thanks,
Sasha

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
