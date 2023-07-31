Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB33BC001DC
	for <linux-amlogic@archiver.kernel.org>; Mon, 31 Jul 2023 09:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OpqyMulYuLO9ZNQT4etcunfMREES8lCDKFbF+IbhuZY=; b=eQYF6Mf6cpsBfo
	25FUXFdIdHKjg5HfXGRA1fJDRzVTly22umtSso6HdzHgV7SsDp2egChUI0ugIjyyDYOVilEoa23fn
	XKqriauv5gQOTESMuxnYf9stbkE/lYogOwy8CFhlmaQqNLMFTVr/rw3YI0dXnN1lrpzPKp6Q5cF/B
	B4kI4AUFoBJcfZJ4cRWXmBrp0BlKW7ciEATlvGxqW76NDv+GK4P0DqK1uXtWYRKmm5HWGI4UU8NSo
	Ld68MOelZRLYQuYFNhyk77p4MDNrIYoiPGb4RX3rn0ElkRSqOAQ5RVV/o145XU54h3RByntIeay7x
	QUGr2FJnoHC3kAk0MRdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQPeR-00Eu3w-17;
	Mon, 31 Jul 2023 09:57:19 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQPeN-00Etr5-2w
	for linux-amlogic@lists.infradead.org;
	Mon, 31 Jul 2023 09:57:17 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3176a439606so3820840f8f.3
        for <linux-amlogic@lists.infradead.org>; Mon, 31 Jul 2023 02:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690797432; x=1691402232;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cvomFymZhU7I2Vx2TPIEyiHuVXkYWyYDGHRfF1f4664=;
        b=MD+DajKB+SVP7k+tJ5gHPLEYuT4K4H07ZJScxsRERnfQ6/YxNIWdSlPl99sQfEAwcE
         o16O7Wsvk8oBuOJUo5JAdV3u8s4uQu+VhoFc5CBgCh8+ox4/P536DKULTzAkrB1i/eHS
         5CwMRtG4F3ji1i0wxyA0HKUD2nFb7UxmyRv0rPtRDcZsEnsiAcAo4MxjzpgLLkuO0VYr
         T8VPiLwl7I0hkRlvFj2ZCe1sJIUYCZVBrfwyLpHHB5QSmPSlwme2vxi7J/ElGYfsNnQW
         yxW7SCeZ1hU8OhyenvrSzTqNXnr7ZmMF+rJe3BZSB0UXWjeD9tg64ZHr5+tE7UVQJeBE
         KpTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690797432; x=1691402232;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cvomFymZhU7I2Vx2TPIEyiHuVXkYWyYDGHRfF1f4664=;
        b=eDZs7neRhxR4eoWZrVcYo+uTKnoTYuQyB1dWag180XSt1ZTPY0ofoRLqzOolL927JY
         /WMoy/T/pL850uINXyIV2sP5kMTp8s2mtpjzWi64z2V+Qx5iagIL/TAVprV0k4TJaXv9
         J1Ibf5HVgmOB6ZTQiGHbNBqEx8qnOyo4wHOb6hiwKLUrnFigl6IbCewSRWLNjzwVmFyB
         15kZjj9qXrgJufObG6WdgAhfHDLvyCMC5yiy+8XSWJIL26v1CpFvC7AhL+28sVow7trw
         uPuVLJP8Kt6Mu6xsjYJjRq4hZcxcICJALPlcWDoas/KClygpjiuthwfMZEGoDbfB9WXs
         6dOQ==
X-Gm-Message-State: ABy/qLayDzTAGR07GM+kBtMHKN5mJIGf/7S97eXriPctbbpf3qTYAqPg
	acMwGh6DDiaRdZUF9mpjd8N2+X/1KHqSplyUh4+N7rt0
X-Google-Smtp-Source: APBJJlFH0ZYPOOpXEhwjoJlo/69P9tZyFc2PgBntVwrgSIqU0HpLBO/1JkqGDiUfL9yVBrJn0onMWQ==
X-Received: by 2002:a5d:60c3:0:b0:317:708e:1c29 with SMTP id x3-20020a5d60c3000000b00317708e1c29mr6516329wrt.40.1690797432299;
        Mon, 31 Jul 2023 02:57:12 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id s7-20020adff807000000b00313e2abfb8dsm12506312wrp.92.2023.07.31.02.57.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 02:57:11 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Zhang Shurong <zhang_shurong@foxmail.com>
Cc: khilman@baylibre.com, jbrunet@baylibre.com, 
 martin.blumenstingl@googlemail.com, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <tencent_AA08AAA6C4F34D53ADCE962E188A879B8206@qq.com>
References: <tencent_AA08AAA6C4F34D53ADCE962E188A879B8206@qq.com>
Subject: Re: [PATCH] firmware: meson_sm: fix to avoid potential NULL
 pointer dereference
Message-Id: <169079743120.199115.7501560948693756884.b4-ty@linaro.org>
Date: Mon, 31 Jul 2023 11:57:11 +0200
MIME-Version: 1.0
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_025716_206452_8839FE6B 
X-CRM114-Status: UNSURE (   9.98  )
X-CRM114-Notice: Please train this message.
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

On Sat, 15 Jul 2023 22:13:38 +0800, Zhang Shurong wrote:
> of_match_device() may fail and returns a NULL pointer.
> 
> Fix this by checking the return value of of_match_device.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.6/drivers)

[1/1] firmware: meson_sm: fix to avoid potential NULL pointer dereference
      https://git.kernel.org/amlogic/c/b18226ffd0807446020841d0c56231518d4efba6

These changes has been applied on the intermediate git tree [1].

The v6.6/drivers branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
