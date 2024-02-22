Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19C8AC48BEB
	for <linux-amlogic@archiver.kernel.org>; Thu, 22 Feb 2024 10:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UFBzxwaw/UwBCmFBnHcfepyvboaZE4TdJwFVKR80Oas=; b=yGRrndVgm8M1CB
	SdcsplHuzPW9fdty9EYhcaH4I7gTWKsPHQjg6+gaaPWx79BDIwKJt1PJFSUjtKvJfyk0OxQ7Keh5+
	hGSTLuxevDTl/UTaDdchFkckrxqNiPj2X3kGHuRvSanuKY3WQlyJU9Jviwt0X7XcVMM9W2k7scCtP
	5A5DNAgqVj+H8ah35+znag6QBrjro785WCZxy0KgSB0Tz/TmmviKJtRD0ehfutcDBlR1G7U5sITlj
	/Pkm/P2d+/6bfkFVCk9CHZ51UhseJVGHevNzuQo0mJjpuvrJXmQeWLzeKJNLDBkvYrpcsdxu35iPV
	F6QuZ3jGSh6WfUyH3Ldw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd69D-00000004Rfm-3fgx;
	Thu, 22 Feb 2024 10:17:47 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd69B-00000004Rek-0y5d;
	Thu, 22 Feb 2024 10:17:46 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-33d26da3e15so432827f8f.1;
        Thu, 22 Feb 2024 02:17:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708597063; x=1709201863; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G1J8J17nCvBwJV4rCbF2JrhC1M/fgT2R9MteVMrLhr8=;
        b=HjtaAPvkrrapGpfWuY0+xIJv5qbtETsUOHD4SK+nTq66wyEYxy95hmqSKiTvSx84i7
         6+Yku5w48JmmOH376WTMS/NLXxeQRHRm9ILh5L/rHTF6MprgIEJs1Fi+1SLJef68RQeT
         mapkB6vJr0Fk2qOEeqMLUfQ0LPsRG2Zvj69vR4z5ASaXLzkOcNGYhBIt0xtEoLpkIjcD
         8YrJ/3JPvP8cvezc7ohzh01tLpisSL89f1lFDHl84wOMnZdSIolqid35+vMn/lWwKF9p
         fyrLNL97GZVOmJdOMfAXlg/C4qCHL8m4Ah/zB6+GCvaGY3HGD1936llcrGVkUfoWxTVg
         19qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708597063; x=1709201863;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G1J8J17nCvBwJV4rCbF2JrhC1M/fgT2R9MteVMrLhr8=;
        b=XUvKjzklcXzoJahCSx1+rgkiIYS5z2r51b6UlhFDmVkH4z0JwsQbCFuc5Uvi17ZdON
         B6TykfyMd64hTwL5vk3Jx8gXJDoB971pNwASgIsZmfq4GoiH8jNosUHiOc2nfzESN73x
         bg7QBoX82yBTUWHBA+3OWXE9xOxTEX25iKTKcz8CbbdQqZ/lVKXS09AGA3pINQLXrHqi
         PyELJ32GTet41kI1XWRK4owlwYpwH7S/lVykV7zv+WIPW/1ZurZQrYpbbtUUfg8SIfcg
         sax8cwdOLuTOqyso+/yB6AMbFUhQJxdnllWHG01muMgOm+ejy028MDfz8uCZ7uT81zpD
         AEOw==
X-Forwarded-Encrypted: i=1; AJvYcCXbGq+6RcPLSRBtRbyB+8a2mRm6Y43KZyejOqC0+A4WfRGpPWLB+t6WhcxnPr9632Hn1NPjuV1x06YhU4a67RnDD6raLN44GgcWHG4wznr0LOYC4LgojKFngDxNu17yVR5M45A5gsCl+k2030IbB+g6QzeUcGhFew==
X-Gm-Message-State: AOJu0YzCoQKjwZi+ewvdOpHQ0t16jy4QoBGWYp2inkSFggzowI/7KHl8
	AAoPuV1zS2B0kejeXVppKab9lOGwqUF0dCzhAguLPYnveCSInZS/
X-Google-Smtp-Source: AGHT+IGGd9rgcsy5ffeIqgGcAUSF1axJ92HYRhWHu2pwd1QcwlwOgUYgod//TagogmfGZq4p09kl9A==
X-Received: by 2002:adf:e742:0:b0:33d:3e02:a5b0 with SMTP id c2-20020adfe742000000b0033d3e02a5b0mr1926418wrn.11.1708597063175;
        Thu, 22 Feb 2024 02:17:43 -0800 (PST)
Received: from [192.168.50.110] ([90.255.110.157])
        by smtp.gmail.com with ESMTPSA id bu7-20020a056000078700b0033d5aee2ff1sm11542845wrb.97.2024.02.22.02.17.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Feb 2024 02:17:42 -0800 (PST)
Message-ID: <32098130-cd5e-4bed-9bcd-155227c6008d@gmail.com>
Date: Thu, 22 Feb 2024 10:17:41 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: meson-g12b-odroid-n2*: Add support for
 overclocking Hardkernel ODROID-N2 boards.
Content-Language: en-GB
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240222082523.1812-1-greena88@gmail.com>
 <1j8r3cet0i.fsf@starbuckisacylon.baylibre.com>
From: Adam Green <greena88@gmail.com>
In-Reply-To: <1j8r3cet0i.fsf@starbuckisacylon.baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_021745_307627_6E9E85F7 
X-CRM114-Status: GOOD (  12.96  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 22/02/2024 09:37, Jerome Brunet wrote:
> Patch title is too long - checkpatch.pl should have given a you warning
> for this.
> 
> Not sure it is wise support overclocking directly in mainline, not by
> default at least. Maybe as an overlay ? even this I'm not too sure.

Hi Jerome,

Appologies for this but checkpatch did not raise any issues re the
length of the commit message.

Overclocking is not enabled by default due to the turbo-mode bit
being set, it still requires the user to issue the following
command to activate.

echo "1" > /sys/devices/system/cpu/cpufreq/boost

It's also worth noting that regulator voltages have not been
upped to achieve this.

Lastly if the HK wiki is to be believed then the N2 (non-plus) is 
already overclocked in mainline.

Best regards,

Adam

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
