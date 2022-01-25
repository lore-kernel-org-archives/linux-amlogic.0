Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBF95C433EF
	for <linux-amlogic@archiver.kernel.org>; Tue, 25 Jan 2022 15:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=8oHdwV4kDg7xk4oJlbNTv/Ync5Ed6yIZbC1iyh+Nnr4=; b=sWqv8UgWySTSAl7rlxH3uQJ5Wm
	uqaWOalwof3GfMSg5NR1ce/a5V6jx4pu8ByPEsB4MfToNIQ2hHZ1y19LhMVMx/BNstkL9M0iAyZ1B
	EmDU3KzZEwIPLaKa2PoGSvsQ69Bwv5W/JBF0CTdPRpGNsAJUJudjfQw4SaTp6wwHhKC2mkC7M5ayh
	6ZFY/aKQz6GE13XbOa4uaKW2/4DBsMIrhahV6Iweu8CyWf5NhWFQ//gbjsCAhlJUJzblLTIypbkPV
	5Oq/iLgcbO5Ks3nlJbh6NIyE8YY+9wRrJZ2R8Iafq5/VidZ9jiWgSxuxx9wIkwAEzDCkzFsNSkHg/
	E6XKahOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCNQF-008HVX-Bs; Tue, 25 Jan 2022 15:07:51 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCNJz-008Es4-U9
 for linux-amlogic@lists.infradead.org; Tue, 25 Jan 2022 15:01:26 +0000
Received: by mail-wm1-x333.google.com with SMTP id
 r82-20020a1c4455000000b0034e043aaac7so1393134wma.5
 for <linux-amlogic@lists.infradead.org>; Tue, 25 Jan 2022 07:01:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Rtmp0dqKHGwJEKozu5JKnqXfvBDShJfZcOYDCM9O30s=;
 b=PLaIGp3oeEgbFGe60Jgv1mgImggG7+BEnaPTWFDFLpU8AB/c4Glw5Y1lfRQHX8syjw
 kCXCkXZSfBREnhzfQtBYYxSGsoa1xrg06P+2QdUcG3lIv2OQM4zSv2cCuSQsQ+vJg8nb
 M1uZO0EnbOpqzf+WTVDVGgxkcY0cVKEdgIfFDvKp1wmg6VyO2cXkpJ1kXbjF6D008eqf
 dVSKKinD9bRqD4UfVCGGgMVlxQbhvh2kE50XcLij98Kh1peJlXL6e1Ser0yKG/MEnU6N
 KECBjAdF3KXPD+KOkLxfkZv+u4LfxDOHP27LUtDnAqfg9K2tH7fGJlO8pLqVL3tSmYMr
 m+eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Rtmp0dqKHGwJEKozu5JKnqXfvBDShJfZcOYDCM9O30s=;
 b=5ffGAYdmbKD8Hmzk+ZdxltIukFAt1Wu8yxrHn/aQT5is1gq4Ik4JvpAvKIogEuR85Y
 Qi62XgIdZ+qcOUTBpBSoPB3F/sxsVNm/+V4ewXR9LcHVIl/bZ2zRj/g8zIU1WDqg73+m
 P/g2avBtoWYamfwSsdlpIo9jHmSu9ic7NFNg75zgRihgDtCEvGAZ0h07kVHU9hRty75A
 uabueQrZtCoiRArc9Cadyrpl+ZTaSspmiT6SrshdNeug2vl/xvnzGaMID20l3vF3viJq
 GpNpHcxNMsWszaaH44q1IIwk07jmO6Aob6aYhCiD9CEn3+vYEwWwnZXlX3CEklQyd0bA
 F1Hw==
X-Gm-Message-State: AOAM531MG7joYsiIf7HIeqBMOg2UuF9QJvOCgkq2OVKoasIxR4p9oUSR
 GgjAm7biZUUY4x2nv9eR2I6bag==
X-Google-Smtp-Source: ABdhPJzc2KXsXyiQcSuN83qgJUqGoOMhhb0gIw+vQatj3F3MBeRiqOh2SqpwYmDMDPz75JiC07+TXQ==
X-Received: by 2002:a7b:ca55:: with SMTP id m21mr3424984wml.114.1643122879789; 
 Tue, 25 Jan 2022 07:01:19 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:e03f:56c1:665f:b320?
 ([2001:861:44c0:66c0:e03f:56c1:665f:b320])
 by smtp.gmail.com with ESMTPSA id o14sm6444341wry.104.2022.01.25.07.01.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jan 2022 07:01:18 -0800 (PST)
Subject: Re: [PATCH 0/3] arm64: dts: meson: add BL32 reserved region to
 Beelink g12b devices
To: Christian Hewitt <christianshewitt@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Furkan Kardame <furkan@fkardame.com>
References: <20220122073221.2398-1-christianshewitt@gmail.com>
 <7h7daoyka3.fsf@baylibre.com>
 <C8B4EA0E-6593-4C42-B116-F9C043D29452@gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <4a8727f4-fbdd-33f7-1f1b-c4baf92ad986@baylibre.com>
Date: Tue, 25 Jan 2022 16:01:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <C8B4EA0E-6593-4C42-B116-F9C043D29452@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220125_070124_003761_FB070DEB 
X-CRM114-Status: GOOD (  16.81  )
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
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

On 25/01/2022 05:02, Christian Hewitt wrote:
> =

>> On 25 Jan 2022, at 12:02 am, Kevin Hilman <khilman@baylibre.com <mailto:=
khilman@baylibre.com>> wrote:
>>
>> Christian Hewitt <christianshewitt@gmail.com <mailto:christianshewitt@gm=
ail.com>> writes:
>>
>>> This resolves a long-running issue where Beelink GT-King/Pro and
>>> GS-King-X wedge on boot or shortly after when booting from vendor
>>> u-boot. In some distros the issue is often reported as triggered
>>> by large file transfers to/from USB or SD cards. Reserving the
>>> BL32 memory region prevents the issue.
>>
>> The BL32 is typically common for the SoC family, so this change should
>> probably go into the g12b.dtsi. =A0Or probably even
>> meson-g12-common.dtsi, which is where the BL31 reserved-memory is
>> described.
> =

> Hi Kevin,
> =

> Would you be okay with the same change applied to GX devices too? - I
> normally have these two catch-all patches in my tree to deal with random
> tv box hardware and it would be great to drop them:
> =

> https://github.com/chewitt/linux/commit/4315ea4612389fc08d0a008b562cafbda=
96374fc <https://github.com/chewitt/linux/commit/4315ea4612389fc08d0a008b56=
2cafbda96374fc>
> https://github.com/chewitt/linux/commit/3c0df794baa7ea9d32d8ad54530b5a056=
c770ea9 <https://github.com/chewitt/linux/commit/3c0df794baa7ea9d32d8ad5453=
0b5a056c770ea9>

Sure, it has been done in a similar way for bl31:
https://github.com/torvalds/linux/commit/48e21ded0432ee1e2359d4143d7a6925ce=
fee1b5

in a perfect work we wouldn't need this since mainline U-Boot does the job =
by reserving these
memory zones, but vendor u-boot exists and isn't avoidable.

Neil

> =

> Christian


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
