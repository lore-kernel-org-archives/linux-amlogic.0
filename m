Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BAF1C38142
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Jan 2023 13:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=68m/EdKtGOzG/tzWk2ICSNEw9lA5Zb3yxSdK5BRUV4M=; b=fLm8cL6FwxNerd
	3opgFFQmPdCZluwt137680CidbH625gVlJOvsgdHVyn4KjUeYoc2Kw+Ou+hCnbXIhnMV9VjkZ5Y5m
	/N7iAQSjR2q5XYepcbR0V0HgPQdhLAKNgUQyByZfEXuTDcvxBFCdMfCVKOs0NRYeg4x9O93mfceN/
	ZEK6ExxIHJh8NsOz6F8JB5EbOG52PdW3zpomy3kACBOAwO7yV7cRBj/t1jvMw34HJr2rWXHaMz9dC
	Zv/isRaWZ2cxxhFauz5ZX1UvriL+OdfXf+8ZSOfGmQGzRXdF+VyuuaJNopwgg6PCBi49b9yRj4YdI
	IYLNb/H/ssRpyZzUllww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLP60-00F7nJ-6h; Fri, 27 Jan 2023 13:48:48 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLOf6-00EwsW-1a
	for linux-amlogic@lists.infradead.org; Fri, 27 Jan 2023 13:21:01 +0000
Received: by mail-wm1-x32c.google.com with SMTP id j17so3458783wms.0
        for <linux-amlogic@lists.infradead.org>; Fri, 27 Jan 2023 05:20:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Iw0lautMML9+B9oBLxXJ8thF9HPKzqCb+aG8qr+zu50=;
        b=uXKcQwboXefuGg34DkvLPbnO42hDpxiN0i9AeKvmVXXjwlAnXHR4GiFOkhE5R6uyLk
         lLGVldCh5cYb+LXp8lCEsaTAzPQdTZkCWraK5jm/CoCvG4G6ahz2+BOK49cjKOK5VrHz
         s1dimII/1cH7RJQ6G/7DUJqlOKsm6LlrrrjbIPQQjnIBc4EnDeU/6TfofV8amZIorAlc
         9qJ5a8SMefycA/vLSCcDLvZo3IAIhC8nuhLVG0pQc+SrjeUuyd6rQ+Z6bpBj5jfTnmLB
         ySF38h8CY5sgcyW90AyzdHOz+576x7Sz648KFvpmx4zXuDF38UFwxImHehhLtRNj8bZg
         oJGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Iw0lautMML9+B9oBLxXJ8thF9HPKzqCb+aG8qr+zu50=;
        b=ElgaZCdT2U0zg3kyVTDvlumIK1g8DH/4016gSJThd3JyxtQiNy7HyXHLtWfVck6DqE
         HTcSgxLti9ljH1l1KWtVC7nIsYE0N/+nBO7CLigA2SncfOd+9AxDWpahLd5/lTnnOgay
         HIyTE4nWeH5vFDkMKlpkYPea6PwaOptJ5eLyi4L31PXmROm7n5KVhuS9ZTwv9/AXqiqH
         gv5HFCtTjNVT+BjfE9SDMtAuTliO14z24Eq+vAVrYgQ63XIinUiJXTgH2FQYi44gE/iF
         ZbvXIsk1NPqFjcsFPPJ3H5G7to9KC4vKH80Moan0ro53pzVOsiz6BJbm3aaHW0/mlvAW
         jb8g==
X-Gm-Message-State: AFqh2kpaJoAYug1KsSDarUaKk8EIAxh/v424YTe7c/DLzLK/qTRpks7H
	0LwkhIPt7Z9K1h1hNo2s8z/Z0A==
X-Google-Smtp-Source: AMrXdXvdCH47nU7ML39r6l1guaL9tDkEaE32Ak6WDXsKPnrT6ag+MUHNn49hIMPBp5XqjlWMArP2iw==
X-Received: by 2002:a05:600c:ad4:b0:3db:11d0:21e2 with SMTP id c20-20020a05600c0ad400b003db11d021e2mr36391836wmr.29.1674825655058;
        Fri, 27 Jan 2023 05:20:55 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id bg6-20020a05600c3c8600b003db06493ee7sm8906473wmb.47.2023.01.27.05.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 05:20:54 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <20230127103913.3386435-1-christianshewitt@gmail.com>
References: <20230127103913.3386435-1-christianshewitt@gmail.com>
Subject: Re: [PATCH] arm64: dts: meson: radxa-zero: allow usb otg mode
Message-Id: <167482565422.1669662.8122640004261744864.b4-ty@linaro.org>
Date: Fri, 27 Jan 2023 14:20:54 +0100
MIME-Version: 1.0
X-Mailer: b4 0.12.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_052100_155862_9D5C03CE 
X-CRM114-Status: GOOD (  10.09  )
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

Hi,

On Fri, 27 Jan 2023 10:39:13 +0000, Christian Hewitt wrote:
> Setting dr_mode to "host" prevents otg which can be useful on a board
> with limited connectivity options. So don't force host mode.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.3/arm64-dt)

[1/1] arm64: dts: meson: radxa-zero: allow usb otg mode
      https://git.kernel.org/amlogic/c/ce43ea00b927805c1fd0450ccc9b4b6069e292c5

These changes has been applied on the intermediate git tree [1].

The v6.3/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
