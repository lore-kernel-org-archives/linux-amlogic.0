Return-Path: <SRS0=zbOs=X2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6904FECE587
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Oct 2019 13:33:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3750A20700
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Oct 2019 13:33:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pS5dC2T6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="WPpYuDJw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3750A20700
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	In-reply-to:Subject:To:From:References:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=1B5Wrl7zNndytPkDPpIYkDTmyLr89fK8EEynor7kVgA=; b=pS5dC2T6Nj8mFfioUpCFrMiX1j
	vBcIuLgoJS1WZSDSjxXuN565PYd4oRMvL6wKA6QNemX9m46mxNxfTVU3f5HKwy7kqkmt3xSC9z/dK
	YLi4yonylLzGnWB6PCeheUbFbH1a7/AzQo0u5cJo6jT5f+iYJ6foiZL+CoMijUw7okpNddQL+8tbQ
	hFFN5rZSifQ48dRJ8Amptkoi87t1Qy4Zvos4F3EOoKyYERnFArFdyxlzmMcbPXUrilGGhV1X28sSP
	wPdpwRLErUN8UPCvFbpFSrxG6JT3p8gnQ/p0Hvv79vETeeBBzirjud75o+j6LIuVeiJxLBqv2emvL
	cT48n3rA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iFIHJ-00014y-K7; Tue, 01 Oct 2019 13:33:21 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iFIH6-0000qD-DI
 for linux-amlogic@lists.infradead.org; Tue, 01 Oct 2019 13:33:09 +0000
Received: by mail-wr1-x443.google.com with SMTP id l3so15543144wru.7
 for <linux-amlogic@lists.infradead.org>; Tue, 01 Oct 2019 06:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=q8MDE5plyoRNJmUuOBtTSfs834j7Iqw1FfFcyxYnumg=;
 b=WPpYuDJwCz9iNVKgfF0rxipBxqDz6nlIWJyQIYTX2tjmWW31ckS60u4AMpswyn2LXa
 t/z/KbgIpMw0jeuBWup6RQaWXmzgbkMuviyWh7pu/BS7MFjCd5YodsekhVnLC2jJbeM5
 v1Xlo9Ye4EKeKfKyubaQzvhchUSVrEKefUqWTNWKoD+agXHS2Lj4h/Nwmk+haJiKOpad
 +6zU2nJo+igVlwYj/14q/YChadBZJmS+2yMEomfmzDXPJZsF994+SqMSkXntC1anNA/L
 0SMsHeTkXHiS5IZ5boMwcT5i8VVU2Aev2dTD23LStWXuQi8qaFI7OmkknTiLH5NWqaCm
 13kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=q8MDE5plyoRNJmUuOBtTSfs834j7Iqw1FfFcyxYnumg=;
 b=P3311NU89Pk4RCikBglQ2bBr5jE1xHcBlGB8VjxQzhbVjKagaqz+6Wi2zjPmgx1f7g
 z2pG92FE3rsC1jSnO6o6LwoWHQ9gaeNxToXdYjZXzPe+J0ZBuCiBTKfZwKZdVapzJzDC
 pGkdArE7HTtLS6nHWMwl6VCvjAllPaQ1fdx0igQX7TMsp5hQ2CHkw/j22TgWOfdZzUp7
 V/MLGr8Y/Furf5MoX77YJfpj7ewNlh2AXCHTQkU+EYKkVvi4EEzz574D5Pz0j5D654n6
 RCt4vRgaFwJpv7df5KabmDEBsfLSn3J/HvsEiuo0Ee+b6DGW7Zx0RXyU5hSKUbqKj32E
 EPMg==
X-Gm-Message-State: APjAAAWhiRyO9rWyq4b01fqtwlYsRzJq7kXFOx9MRUqkXIPFXYAg15B3
 /pvS8jNJpJ88xIHMyxACXyyLO8+5YyU=
X-Google-Smtp-Source: APXvYqx5UTPwgHB49ZkRR24PRLoPJyqRoXoDTxxZ9PbUtFADeW5Y7oQDqDrFvTZvadHS8fHEj1cltA==
X-Received: by 2002:adf:ee05:: with SMTP id y5mr17074158wrn.291.1569936786513; 
 Tue, 01 Oct 2019 06:33:06 -0700 (PDT)
Received: from localhost (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id a18sm24360812wrh.25.2019.10.01.06.33.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Oct 2019 06:33:05 -0700 (PDT)
References: <20190921151835.770263-1-martin.blumenstingl@googlemail.com>
 <1jsgons4wy.fsf@starbuckisacylon.baylibre.com>
 <CAFBinCAHD+D=a2mHeHMGq12MvoksHBr308jSrdcH+UYsUmwd8w@mail.gmail.com>
User-agent: mu4e 1.3.3; emacs 26.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 0/6] add the DDR clock controller on Meson8 and Meson8b
In-reply-to: <CAFBinCAHD+D=a2mHeHMGq12MvoksHBr308jSrdcH+UYsUmwd8w@mail.gmail.com>
Date: Tue, 01 Oct 2019 15:33:04 +0200
Message-ID: <1jeezwr3ov.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191001_063308_447582_18F571F2 
X-CRM114-Status: GOOD (  13.32  )
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 khilman@baylibre.com, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Mon 23 Sep 2019 at 22:49, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:

> Hi Jerome,
>
> On Mon, Sep 23, 2019 at 12:06 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
>>
>> On Sat 21 Sep 2019 at 17:18, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:
>>
>> > Meson8 and Meson8b SoCs embed a DDR clock controller in their MMCBUS
>> > registers. This series:
>> > - adds support for this DDR clock controller (patches 0 and 1)
>> > - wires up the DDR PLL as input for two audio clocks (patches 2 and 3)
>>
>> Have you been able to validate somehow that DDR rate calculated by CCF
>> is the actual rate that gets to the audio clocks ?
> no, I haven't been able to validate this (yet)
>
>> While I understand the interest for completeness, I suspect the having
>> the DDR clock as an audio parent was just for debugging purpose. IOW,
>> I'm not sure if adding this parent is useful to an actual audio use
>> case. As far as audio would be concerned, I think we are better of
>> without this parent.
> there at least three other (potential) consumers of the ddr_pll clocks
> on the 32-bit SoCs:
> - CPU clock mux [0]
> - clk81 mux [1]
> - USB PHY [2]
>
> I have not validated any of these either
>

Then I would suggest to leave patch 4 out until we can somehow validate
this. 

>
>
> Martin
>
>
> [0] https://github.com/endlessm/u-boot-meson/blob/345ee7eb02903f5ecb1173ffb2cd36666e44ebed/board/amlogic/m8b_m201_v1/firmware/timming.c#L441
> [1] https://github.com/endlessm/u-boot-meson/blob/345ee7eb02903f5ecb1173ffb2cd36666e44ebed/board/amlogic/m8b_m201_v1/firmware/timming.c#L452
> [2] https://github.com/endlessm/u-boot-meson/blob/f1ee03e3f7547d03e1478cc1fc967a9e5a121d92/arch/arm/cpu/aml_meson/m8/firmware/usb_boot/platform.c#L22


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
