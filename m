Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA069C2BBCA
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 Jun 2024 09:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BtMoooAVAH+EgfipTRv3FNOlHkY76z1VFn3/jJ1PUBY=; b=BSjd2bjJOCr8RF
	1XaenCyYnejiUIyFDMIC1wy6o0dCgE5pR67HFqajUdEgHGB2qkvVkzv3Qd7sXUPU6MJsdOEYc9f/7
	MPMEzPEeFFktlx7M+ukCeR8jyD+7r70D5Qxk//SSZxHAG5RhPvoKIZo8F7l7CBJACM5Yh4tpc8mnV
	QvqD/YFRrkNVse1S3KIWwM2Cqq4fPexjThX8GpDWXGlNZen6o2Eihp+m1Nff28wnzOaxULIx8KycI
	XX5uJkttPHmoKVUs8WU1cilvLbzSrjtWSgbMYWUcI/x1dLE643hLVE55iwWxbGYNeuPRVwVHCD3IZ
	U7etzXhkxLW5yS5gq1lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN7d4-0000000DDW8-2hFp;
	Fri, 28 Jun 2024 09:10:50 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN7d1-0000000DDTv-0ksR
	for linux-amlogic@lists.infradead.org;
	Fri, 28 Jun 2024 09:10:49 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-42566fb8302so3199135e9.0
        for <linux-amlogic@lists.infradead.org>; Fri, 28 Jun 2024 02:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719565845; x=1720170645; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=5ww0hI7XhMOpeyVcfMbag2lDGd/Ez+xcshxdAQFbPSo=;
        b=3W+DhJi3O0gmY8hHJFFAGtKNj3FCyzN0K2hGUT7uaIHUCYVgEm8H6CPsRE4A23hryg
         H6Ao739MFkZS9C/3CruPeXpLqmVDo8OTVIS6CvL1/cM+hNqCwqEMm6Yq2uwxE5YT/5po
         2pj5eWd3J+DeR1HvLC3CQASdVC6SpNFJ0gtmDFO2kMNZplouCWcHwys9gFIo9RAJKBhF
         +x+U2GwsYZ+iH7d0mrOLw7wsZMXZ3DPCzZkLs14yC+oqjOxenJ1XDAQ2LH41CAIzNFvC
         CnlSt0Aj+nn7tZs56sh9wBVngKOv7OVhwoU76n18/bhMLB3sRRa/c1HyT2tH3BMVgifN
         Uc+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719565845; x=1720170645;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5ww0hI7XhMOpeyVcfMbag2lDGd/Ez+xcshxdAQFbPSo=;
        b=WH+1KmTpCpct/YZUuCyIn94htGudA09jm9Iujj2Qo6TNK73Tnmca+frJ2fujUl8jy2
         8q7DfxZobIHx6E9yn9l68COdoZbxUeCSdu9+pVcUC9+kSqLUhGAujLidP/gKYPt5YPQh
         VvjGa6O0oy7unabg16sqBU8i/r4tGOyJ2sNtdr0dn2dEjtgMhvzS9Zj+6WS6fwvTKYAO
         gGzTOiEXeTlvWkWvu62u43qT4t6kO430vfbOMz6tA6ETXmIy0cO8Fsftfhen0hqeIRCT
         jRpSo3vqmsWzJ7F4p3lDr5fwksb5B3hIIqdNnuHZIzn4PKw8frVC+0yxRoPhdG2H4m/n
         C5vQ==
X-Forwarded-Encrypted: i=1; AJvYcCXuyGMZMIuTlX5wxOSO8PAAb6rWDVQ0pGLmT5Rftyn6YWw5G8gYEBE7a5ix9uCSZB50ln9BenMrjnGhZgu9jS5FM0i715qVeXH6X7pjXGSYFzc=
X-Gm-Message-State: AOJu0YwowlqtZkUJ/wvz8YDqEB7K51MH+2cZk+Y++HpVG39DtCU0dk5R
	wtXRoHUkYu45dy2zjPEUX0DqoWjgpkZ4Ti3mGIY02kQfX0OxupKXqT7nDpUzi+c=
X-Google-Smtp-Source: AGHT+IGfaRuokgh8AwoWqD+NRn4IvomA5WN9aP0+KKJTCP84NJnYxZfzokA4lANRvxjFgX20EM79nw==
X-Received: by 2002:a05:6000:2c5:b0:366:e89c:342b with SMTP id ffacd0b85a97d-366e89c34bcmr14945201f8f.52.1719565844836;
        Fri, 28 Jun 2024 02:10:44 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:d2a2:5e83:89ff:e781])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0cd60dsm1652136f8f.2.2024.06.28.02.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 02:10:44 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Kevin Hilman <khilman@baylibre.com>,  linux-kernel@vger.kernel.org,
  linux-amlogic@lists.infradead.org,  devicetree@vger.kernel.org,  Rob
 Herring <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 0/2] arm64: dts: amlogic: handle hdmi system clock
In-Reply-To: <16ec9c9a-badb-4626-9227-fb03f0ee3ee6@linaro.org> (Neil
	Armstrong's message of "Fri, 28 Jun 2024 10:10:22 +0200")
References: <20240626152733.1350376-1-jbrunet@baylibre.com>
	<16ec9c9a-badb-4626-9227-fb03f0ee3ee6@linaro.org>
Date: Fri, 28 Jun 2024 11:10:43 +0200
Message-ID: <1j7ce9xwj0.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240628_021047_483428_56A7A071 
X-CRM114-Status: GOOD (  21.55  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri 28 Jun 2024 at 10:10, Neil Armstrong <neil.armstrong@linaro.org> wrote:

> Hi,
>
> On 26/06/2024 17:27, Jerome Brunet wrote:
>> This patchset adds the setup of the HDMI system clock for HDMI Tx.
>> This is another step in cleaning HDMI Tx and its direct usage of HHI
>> register space. Eventually, this will help remove component usage from
>> the Amlogic display drivers.
>
> Thanks,
>
> Beware we will need to keep old DT with new kernel functional for a while,
> do removal of component & HHI in meson_dw_hdmi would need to wait for multiple
> kernel releases.

Oh, I'm aware of the pain DT backward compatibility will be on this one.
Situation is slightly more complex than the PWM ...

I'm not sure how keeping support both for the 'legacy HHI direct access'
and 'modern API and region' approaches will look like. It's likely to be a
mess.

What I posted so far are things I'm sure of and will not cause issue.
When I get to the controversial stuff, I'll post an RFC first.

>
> A migration step would be to add a phandle to hhi right now, so we can drop
> components earlier, then in a second time add a proper PHY and then mark
> the hhi reg as deprecated.

Giving the hhi syscon to HDMI-Tx is solving half the problem.
IMO, HDMI-TX should just get the HDMI PHY register space in HHI. Indeed
that could be added now as well, without causing issue to the existing
DTs and drivers.

The display drivers should not directly poke in the HHI bus, nor should it have
access to the whole bus.

If we are going to take the pain of fixing the DT interface, better do
it once and for all.

The 2 main HHI offenders are HDMI-Tx and vclk:
* HDMI-TX: I've got the that mostly sorted out, for an RFC at least.
* Vclk: Here it is more a matter CCF usage that HHI
  * The HDMI pll could use the regular DCO/mult-range driver from what I
    can see
  * The vclk display would need to get the DCO clock along with all the
    ODs/divider handle. Without rate propagation, it would be free to
    recreate the setups it needs. I don't have the full list and I did
    not spend much time on this yet but that's the idea.

>
> Neil
>
>> Jerome Brunet (2):
>>    arm64: dts: amlogic: gx: correct hdmi clocks
>>    arm64: dts: amlogic: setup hdmi system clock
>>   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 5 +++++
>>   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi       | 9 +++++++--
>>   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi        | 9 +++++++--
>>   3 files changed, 19 insertions(+), 4 deletions(-)
>> 

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
