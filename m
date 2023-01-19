Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85DC0C38142
	for <linux-amlogic@archiver.kernel.org>; Thu, 19 Jan 2023 07:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ooDwfmcrUBb4SMkiCjpZpv2sxy1OMcGpmdtBDh1eEDQ=; b=XPxeHKJIvUbJIW
	s4dFuxrjRyIU20t3gKbgwaUcTuscghtaUjJBtdRp1ZEidAt/Kwkawnd1PIxdUtReF8krbhk8e4wKy
	Z6ZrzfqVJpM1Fn0fUXrgciRypyC/JPUyFMMRDVC6dJhrGm9ef6W10/ziDBNmvAzPtZKpcmqblJ2K5
	8Ooegh/EMF8O4Ap5SCdtWF4zCryrxuinr6m6qGGZdPWjzDm4Zj2PpqanzR9Bgku6fr32OG3XHSycl
	x193ITqiw/fL9fbjFP8iR7jSCRKKcc90Mu/ibGTaOrup+sqnHkuih1Oxh9o0pT2RR+ytFohMdA2uE
	hEOC6QoHIe76FhXyabxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIPoL-003zb5-6k; Thu, 19 Jan 2023 07:58:13 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIPoG-003zXz-DP
	for linux-amlogic@lists.infradead.org; Thu, 19 Jan 2023 07:58:10 +0000
Received: by mail-wm1-x329.google.com with SMTP id j17so857472wms.0
        for <linux-amlogic@lists.infradead.org>; Wed, 18 Jan 2023 23:58:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ij8SMr+vXbA/AZuiMltivscr4/Z1+1DiXSChaaWBJLA=;
        b=jNvClj4Hgs3XtM8osi2wmiQMtbXX9Pmtcv550+503yOGAXBRa9d6VoF6cZTm2h6Gjv
         vqqmXwxeBDQDNJFNBGX319WcRnTcclvjKfxqDfdIS30rx6KVsgnwyMEWlTKXRyc0Sm1S
         mT6WXhFENhT0S469DnFce32rQRt/pYYaIYOUIfZhQsd/6CIV99iyCTx6nLFqzlNgInrS
         cCvHfjWbI+6EBPHsRh6f0fBLcwDK9wLvu5FAYXYqrEVrL2EqadlKhKiQGZ+7HNMzwxLc
         oPDSOBQB00PBTJJ3qmuUvqX3Bv44IPfj9wYpGqyMB8IaWS9L0X8YL8/ELk/0dd9wpVwy
         2cYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ij8SMr+vXbA/AZuiMltivscr4/Z1+1DiXSChaaWBJLA=;
        b=F83H4spWEos9VqrxJH99VlL931vGRbm+BjdNAc+560+7szea/VQkz1iOA7a9PhM+ey
         zNftlPCZsUGgVSkg2bPXdtjSjMcvorFIg8kh+Ij/nY+lGMJW6IZrA0QHHLUe0oI1RH2o
         6aKZfvVVbHxgDChgG2tjPPUGBXye3/QAguy8hJhn39Ubl3XyrJVBpzTusRDzwIGDUv/F
         cmOXVHKCosJWX6EZOkQvJ+gVS4QAi3YYm/wycek7O54qCyfR5KawHm1HXJ7Ar2rEm75l
         gvWNRVJafSiTMWVPr5juIZHQ9kYDoQuROD3Jo7hnfkEV+/YGdIOaHFt5SerCoNu9PytN
         qPgA==
X-Gm-Message-State: AFqh2kqvqGPZ/srX5ZL+I/5NkDhJbOv3BL5enyjl4fmO9PD0LXYabuYd
	y0pB4wZZGXL2OVpJS2LreD6Spw==
X-Google-Smtp-Source: AMrXdXvJcNubzirilufX37J3RKkYIRh76X2L8Sjqd3Dsl7pC4Q5esy4zyFFYuUszjgUWfmEGPa2dtA==
X-Received: by 2002:a1c:4c0a:0:b0:3db:210:6a24 with SMTP id z10-20020a1c4c0a000000b003db02106a24mr9024938wmf.8.1674115084639;
        Wed, 18 Jan 2023 23:58:04 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id p15-20020a05600c468f00b003d9b87296a9sm4115776wmo.25.2023.01.18.23.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 23:58:04 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: linux-amlogic@lists.infradead.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
In-Reply-To: <20230114233455.2005047-1-martin.blumenstingl@googlemail.com>
References: <20230114233455.2005047-1-martin.blumenstingl@googlemail.com>
Subject:  Re: [PATCH v1 0/2] ARM: dts: meson: Add more L2 (PL310) cache properties
Message-Id: <167411508395.294260.17502522944795124544.b4-ty@linaro.org>
Date: Thu, 19 Jan 2023 08:58:03 +0100
MIME-Version: 1.0
X-Mailer: b4 0.11.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_235808_512982_A0C102DC 
X-CRM114-Status: GOOD (  12.70  )
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

On Sun, 15 Jan 2023 00:34:53 +0100, Martin Blumenstingl wrote:
> I had these patches in my testing tree for a while now. The vendor
> kernel uses the same configuration, so it probably makes sense to
> use them upstream as well.
> 
> 
> Martin Blumenstingl (2):
>   ARM: dts: meson8: Add more L2 (PL310) cache properties
>   ARM: dts: meson8b: Add more L2 (PL310) cache properties
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (for-next)

[1/2] ARM: dts: meson8: Add more L2 (PL310) cache properties
      https://git.kernel.org/amlogic/c/12cdc236cf83eb55560f52dd378f05d5798452ba
[2/2] ARM: dts: meson8b: Add more L2 (PL310) cache properties
      https://git.kernel.org/amlogic/c/46f73c1c037eed8e5fd61cc39c77b0988148b50b

These changes has been applied on the intermediate git tree [1].

The for-next branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
