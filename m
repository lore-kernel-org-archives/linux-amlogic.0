Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8340C44501
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 Jul 2026 10:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bNdy848t16738nb6TNZeQMV33zF8Ngr2fG/czlJBjvs=; b=PZ7kw0LdMtPu3u
	1xvZ8robNCoDFOm265JOTNUsyqDCaqczA6LFti4hABfNeMxKefjXa8o0Zh8YvtRyvec7YSCAVeZmb
	4MrW4Q7NgNCSXL8t9bS1WAQhZ8ESBjK6iqbdM5h+GIi4eVVB9vpNy/nfK1sWNYSU07J5hQ8IEmbEu
	EZTUxdey4/rAyTr8+JcUPqBr1SnTcU+PzhJyarHba/4dspEZl3B6v5Zm8w2maan8TuQ2UXARS8yX2
	udRYrvBf3uXp9XnfQOuo66DuiHjGqFK3GUg8/vBQRe+MvnaJ1yllJrp52+70QdlObjPjFx1Oovyfa
	PcoCTaj2cG2reI9APY0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfbEx-00000006eVW-3YmY;
	Fri, 03 Jul 2026 10:35:23 +0000
Received: from mail-wr1-f44.google.com ([209.85.221.44])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfbEt-00000006eLz-3Ltr
	for linux-amlogic@lists.infradead.org;
	Fri, 03 Jul 2026 10:35:22 +0000
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4745492ed3aso275160f8f.1
        for <linux-amlogic@lists.infradead.org>; Fri, 03 Jul 2026 03:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783074917; x=1783679717; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9aa5VRYjwfcBa4J0ha82pG4RI9w9o+IbdPuBnZ7LdEE=;
        b=Q83CnW4f4k7zDHFAAWOcwbuhceZXesChnZfPuZJu8h2gHqZQ2KXN89TEKAo9KMbh9J
         C49mUSoFG4rS3FT2VlT5Wn1M6i3xOixREcWBvg3CXjNndt7iuZ6ojHA9F+EwKrFWVoQG
         rqe/1WsnsoqO0hlEY9DDIkux39bz9sCS6GjAXkWMl9sTHHmY1g3mBGy8HDwcpX0/x/yp
         JHyY7DNYd5mtkMZVHgpK9oyHCspsh+F6ASHiLXD56kxQcr4O2wIx58uXDb+6Y0QY7xAd
         JvSVpfyIoSW0tLe1XT7ijD7gjUyGt4/rRucRaod7Ywm3BfhbPupvdNXNgRAfP6oIh312
         O3Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783074917; x=1783679717;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9aa5VRYjwfcBa4J0ha82pG4RI9w9o+IbdPuBnZ7LdEE=;
        b=TJyMVMVQoR2HakmBQwNJH5rbPeKuU+igCCgkV+Urbx4Kv4fPXESjgcMpFuuqD2zfxO
         9872fy02hVNXps7J47Qd4Fs5dI2nHshU2EPWzwFRyaFplMU02Xg91Z3ftgheiLIEwUCU
         Uj7QORizvAeVg9+AVj0EtwxmcVBxGRGCWM+IEngtWtURVcC3ejrid060due5sKe9Qu8k
         cZ9FCzJ8BHHVWMTFqPe8kkxLt4t3KbrJZ7qbTwNydM7C302rKhqEq3PuOe5mJFc5ik4B
         6n/PPSEzQxq7KAnMrWj4xRklIdxfPWEJEhmpGuq1PiKCOcKhMjM5RUIkauucfTWK9XIZ
         0RCQ==
X-Forwarded-Encrypted: i=1; AHgh+RqscA4zUQnOHm6u8WoVAWHEVByNYsrZ5iW3aavUAhmcuOH/K8oIS5u27Y1DFLWrNqvacgaB3WAe6y6g69N3@lists.infradead.org
X-Gm-Message-State: AOJu0YzK+T2Dfr6CuiFDZJ7Om5+f3qJ6GzFGcspi9A2j2nCCamLJbxH1
	8oZGWKc0yFTJQWps5bj4CgB47xrMX2doc0H281YzQLk/lBtCoe7Mf+zy+NvuFF0DyQc=
X-Gm-Gg: AfdE7ckYck7CkBKD+VkLFBdYUZ8cLDm0Yo4lNyw4tdetDnMY4FFbBGia2QAeFAxLCEU
	84XkW93djPLx9Kos0yuD1M4cwEJnlhXQdvsKbV61LQetku8L0hmsBQR/47tzpl/Kfqcbjh2owkk
	w+hA2MygBQ+5uEuaG4nAavYpvoPqColM2Say0aww1TS5/w3H0vbB2p5EH+7He/gJcuojepN7KZW
	W5FJUEc14fG/Fs5Kspk5OUmdQ16Tlk0h4UfIVYae+xAg+WwBfO9zForhtZVY2C++UaIb1cehW7Q
	Mt0/NvJRqEKKhDBv67lu0TOpaSYYGjwJwA9d2FRYv0D7DRCq+3QXAv+7/0y/YCQFZLbdhYUTxY+
	2Lp7fg58LeBbtDCl90hyyTfWNhkpX+ddcmxdLonNOoGjCVn75l8Z9PMh3zg/6gS2Nq6O3+CcRcR
	r9RnG9ZkoJl1AL5qUqnVl6b+G9sA9PhDDcLpLGZ++DL1kf
X-Received: by 2002:a5d:5d82:0:b0:473:fe94:9bf1 with SMTP id ffacd0b85a97d-47757f4c487mr15276685f8f.26.1783074917112;
        Fri, 03 Jul 2026 03:35:17 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477db8a450bsm18149405f8f.10.2026.07.03.03.35.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 03:35:16 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260629-a9-node-v2-1-dadd3401fccb@amlogic.com>
References: <20260629-a9-node-v2-1-dadd3401fccb@amlogic.com>
Subject: Re: [PATCH v2] arm64: dts: amlogic: add some device nodes for A9
Message-Id: <178307491598.3384545.582524500298213361.b4-ty@b4>
Date: Fri, 03 Jul 2026 12:35:15 +0200
MIME-Version: 1.0
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_033519_858787_57CF6359 
X-CRM114-Status: UNSURE (   8.86  )
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

On Mon, 29 Jun 2026 07:52:53 +0000, Xianwei Zhao wrote:
> Add pinctrl and irqchip-gpio device nodes for A9 SoC.

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.3/arm64-dt)

[1/1] arm64: dts: amlogic: add some device nodes for A9
      https://git.kernel.org/amlogic/c/3ecd66ea250b81dcc847253efa6e4d691e6523c8

These changes has been applied on the intermediate git tree [1].

The v7.3/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
