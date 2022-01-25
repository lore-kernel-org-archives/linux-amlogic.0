Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21733C433F5
	for <linux-amlogic@archiver.kernel.org>; Tue, 25 Jan 2022 04:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LAaeFad46Mpm9U4jm6t2DZ1RcHfuhwJqDaExVKkghCA=; b=pp+J5vmrU72SyK
	XEIWEikNXvf4M+hBSTHIk0Ld70kePdyFIME4uUlVqVxZuntrEyERIeI2EkUgclIIOcP3xJByqTj09
	Dj/Nq6GERBUrAhFmlAz8LymPcbv62ZlGNXIFQBVtYLxE45INwX1JQk9ptRr8IZhljK//aL+XWx76y
	hwtLQmeh55YfsFDLGasxBGYGhF9WIUC6/aM/EjUfUDA4/oYBfImvd5RaC9C4QH9ecSbnZWTl3omgi
	td3sU6YAzfT5SS95NMztL7ole1cq0uDAzjD91ki7QyVRmJKryuTGwL5Xpe7j6TpDdsWU4s3EfvFKM
	HEvYH2F7t4FCMgMqlRdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCD3F-006Pkl-Pe; Tue, 25 Jan 2022 04:03:25 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCD33-006Pjh-Ps; Tue, 25 Jan 2022 04:03:15 +0000
Received: by mail-wm1-x330.google.com with SMTP id
 c190-20020a1c9ac7000000b0035081bc722dso634603wme.5; 
 Mon, 24 Jan 2022 20:03:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=C3FYe6TcjYjJbJdwbX6OqfjeFpVDE2oMdSSX3Pq1Ukk=;
 b=pKcHkaFv8cJewfXGxbaoexn8ygvz6aAsVsgb9im1bfgH1/UQPgeCfqahJ2dR2Jd6hw
 AOgIxBugel8w8NhNgNGUc96a62L5XLi7ClRbyVQaZ/sWNJTCZIFAWX3weKU8H0yMhADj
 GshQQfTaDIR+ZlBSv64qpiXbAhGVgFWhYXgI1NfaxBLlAfZYrCChvz7mNWx8KV61CCBN
 oipUOMRVHvtv4shz3+ZU5vVYSz283rDSviTI8EVMkwsiULDNG+eCrrZhNHOmOIOsMsrK
 ISx+Ta2LMa0Eh2OF2o+sGHLDFeQv4ktn5kAjzEIZJGfbHqgi10b/wM+h1LpOutSeBVLN
 rghg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=C3FYe6TcjYjJbJdwbX6OqfjeFpVDE2oMdSSX3Pq1Ukk=;
 b=YZMWfXmqjboqV2veZd8TeNHFa8sBUnL6KFUNYTQHB/eZKPxDMhpQf+OMQJWV7a28SA
 t1M186fC3Uog1pZlP8MyD2rIRY1CrGS1W/BA0CG2q71tU6Cw6g/itQr09V/JFzCZACOP
 R3XPNy5tS7cNlgQcCC9232CPNddDMIDck5St19d3eajqHYoP7kYdKbTq20ar0FKt19fR
 wiMxvcCGmP8/LSlNy1Yv6tHOBhcwHAWwqbqlYu57dJXVRWqBbXN0oaw2BHP0X4OqgnyQ
 iJAuxh9fC2t+kxDuahm/L39xM8xZnzyFPu7EbPKB0flytuBxTXh5jDLAlNyGTK3WkI2e
 d80A==
X-Gm-Message-State: AOAM530H/dguJvOQvDWfRpgOeu8Wlx7AInQEJbMhTAshp08NySC7/8d8
 JTYC26b+SpdrjZmN71qmQb8=
X-Google-Smtp-Source: ABdhPJw35D0LrxgrZWlhbeSpwAo2a4wXCmg7DUqpptX4Hs+orfcpR6co5iihxpSUNgAQICwdVQ+zVQ==
X-Received: by 2002:a05:600c:3797:: with SMTP id
 o23mr1116133wmr.158.1643083392066; 
 Mon, 24 Jan 2022 20:03:12 -0800 (PST)
Received: from [172.16.20.20] ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id z1sm1039020wma.20.2022.01.24.20.03.10
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 24 Jan 2022 20:03:11 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.7\))
Subject: Re: [PATCH 0/3] arm64: dts: meson: add BL32 reserved region to
 Beelink g12b devices
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <7h7daoyka3.fsf@baylibre.com>
Date: Tue, 25 Jan 2022 08:03:09 +0400
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Neil Armstrong <narmstrong@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Furkan Kardame <furkan@fkardame.com>
Message-Id: <3A7E4C5F-AECB-4A3E-B074-E2E3419DD749@gmail.com>
References: <20220122073221.2398-1-christianshewitt@gmail.com>
 <7h7daoyka3.fsf@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
X-Mailer: Apple Mail (2.3608.120.23.2.7)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220124_200313_868127_EF237362 
X-CRM114-Status: GOOD (  12.59  )
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

> 
> On 25 Jan 2022, at 12:02 am, Kevin Hilman <khilman@baylibre.com> wrote:
> 
> Christian Hewitt <christianshewitt@gmail.com> writes:
> 
>> This resolves a long-running issue where Beelink GT-King/Pro and
>> GS-King-X wedge on boot or shortly after when booting from vendor
>> u-boot. In some distros the issue is often reported as triggered
>> by large file transfers to/from USB or SD cards. Reserving the
>> BL32 memory region prevents the issue.
> 
> The BL32 is typically common for the SoC family, so this change should
> probably go into the g12b.dtsi.  Or probably even
> meson-g12-common.dtsi, which is where the BL31 reserved-memory is
> described.

Hi Kevin,

Would you be okay with the same change applied to GX devices too? - I
normally have these two catch-all patches in my tree to deal with random
tv box hardware and it would be great to drop them:

https://github.com/chewitt/linux/commit/4315ea4612389fc08d0a008b562cafbda96374fc
https://github.com/chewitt/linux/commit/3c0df794baa7ea9d32d8ad54530b5a056c770ea9

Christian
_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
