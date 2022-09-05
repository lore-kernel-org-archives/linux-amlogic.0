Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F28EEECAAA1
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Sep 2022 08:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=25oF01viNUxfGUh+FObkfojYx4cBOiHmm/cBF6qSt+o=; b=MdYh+H8ktDikKf
	OfjGEU6XFHLjpxlZ1sMm70+dGXENWNXFvR9F6LhvzieAi/uOhSgM275sB2RXR+tLkeGboEa2TWBjW
	C+M/KcTUkSnppbXcz3gD/u5nr9OJFKv22eh4QpgPOkDAO71e1QHH/qh03YuGgaD2uWdTFiuKa53n6
	JV6nuMdnLWCbQHqwEkuYam9FwTudzYMnAlWilJ6RoxFJrvojb/YjPsYATHLT/a8j17mXh8nKHvhtf
	dZnaoejNmbFq/95ebQo92E9nbnEw2hPs+cHrdNDIontINrYEugqqkFg8kEG7T44XN92yHUBKYlUFt
	fjAT3xvbfEhBbKNbbXqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oV7pO-00Ezh8-Ft; Mon, 05 Sep 2022 08:51:34 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oV6VM-00DHSs-6J
	for linux-amlogic@lists.infradead.org; Mon, 05 Sep 2022 07:26:52 +0000
Received: by mail-wm1-x32f.google.com with SMTP id s23so4765820wmj.4
        for <linux-amlogic@lists.infradead.org>; Mon, 05 Sep 2022 00:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=lnIlSEWqt2NuMr0K7xfjm9a6tpssYyqRvH3ULhoQs6E=;
        b=EUI+aE5By8Fm45Y8d6L5isq9giQdqO2xEjrOpxA9/qsJFGKS0KWzRvv72P6F6VQdC4
         FtWJ1HPSQ3R/HXPiL0FfRC/Qi+mYDb6QxD6bj8I0NPbTiWT1o+BQBTZZllIiyZGU9rJs
         73V8ODYo2WmN5Eh5uFydeP1Zakyx/rScuuzFvl/VBVF7D3HfBd9Fi+T70LqG09GUHCWH
         nU65d5GiBV4aHNIUEaZKmYbmLECM3B5RWTB0RflQQ3JK+mYnGncfmpJ700ImmjrELBNG
         2lOjgR2LHVf1JkOB4BfGeH151hMJsCFzAzHotkYTFcZHgksAoMzk9H6rLOTGp8U9eFzm
         7Otw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=lnIlSEWqt2NuMr0K7xfjm9a6tpssYyqRvH3ULhoQs6E=;
        b=Cqp0KEmpqI/OMG0HIPlk1dhau08D4KSuWyhh+dyW+HRmesogsjbpEODDFkvNEGqwVf
         mkChIXLr3o8LD7Kt2YFpQrXVKdndV7kywYplVfZonqSaxLQVkYX9x/Gxs9qRdxsR5JE+
         GZBxYVTtsqabGE7amREJp/JzqPkEKftWTquOrr5XlAcCArm+736sG8+f2C9uJ3aw3MFW
         ZOmn1NTWzP38PiiqS6HHo96LFOO3W7sEdDOA/iR3dkY0zLdF6zcXaAJBpwFXzWJ9wSoy
         noPebxHJsmR3/y3Z+iN+FtLBQcllheEekVSL2ThxW6WjLNtHlnykLDd1MKE4TBBIGvTQ
         /Nxw==
X-Gm-Message-State: ACgBeo0Ki5Wb3TtQ+ewOrTeVg4D/juNWOKEtrt2oQanHi2O4wywS6CnF
	Jbj54KioHK0nMB1J/pBOMdhLKw==
X-Google-Smtp-Source: AA6agR7e3YZmCionyQgAwi+41U/5n8SW9PV18lBGEcpsXwbdFta/TDuiQqzLXJkQWdRl/uFr+MusIg==
X-Received: by 2002:a1c:7907:0:b0:3a5:a965:95e6 with SMTP id l7-20020a1c7907000000b003a5a96595e6mr10026082wme.75.1662362806227;
        Mon, 05 Sep 2022 00:26:46 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:982:cbb0:f365:27e9:453c:4c15])
        by smtp.gmail.com with ESMTPSA id l17-20020a05600c1d1100b003a5fa79007fsm10521723wms.7.2022.09.05.00.26.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Sep 2022 00:26:45 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: linux-arm-kernel@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Christian Hewitt <christianshewitt@gmail.com>,
	Kevin Hilman <khilman@baylibre.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>,
	Furkan Kardame <furkan@fkardame.com>
Subject: Re: [PATCH 1/2] dt-bindings: arm: amlogic: add Beelink GT1 Ultimate binding
Date: Mon,  5 Sep 2022 09:26:44 +0200
Message-Id: <166236280066.644940.15832711054372731780.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220707093954.21716-1-christianshewitt@gmail.com>
References: <20220707093954.21716-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220905_002648_793599_88F929FF 
X-CRM114-Status: GOOD (  11.48  )
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

On Thu, 7 Jul 2022 09:39:53 +0000, Christian Hewitt wrote:
> Add the board binding for the Shenzen AZW (Beelink) GT1 Ultimate
> Android Set-Top Box device.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.1/dt64)

[1/2] dt-bindings: arm: amlogic: add Beelink GT1 Ultimate binding
      https://git.kernel.org/amlogic/c/70bff3a65d4b974434b7f576f52a269fa4f0dd04
[2/2] arm64: dts: meson: add support for Beelink GT1 Ultimate
      https://git.kernel.org/amlogic/c/5b3a87a5c4f20da682d50dbaf8c4aa357cfd0d2d

These changes has been applied on the intermediate git tree [1].

The v6.1/dt64 branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
