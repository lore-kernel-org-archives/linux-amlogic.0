Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5E99E7849A
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 Oct 2023 07:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L7YrBUdnMqDDnkjsuxKrHC6Q/WY6VszFPPkeD9+gJMY=; b=eTDQ0KfkN1xGSY
	af5c+KUhKiieaszeEpRn7SU/YUqlOukgI8rEMG85hFcu+Rl0RR+gV0Y6NEFjO+pcRfycflW3N21sT
	pcqKy/22L6Y9tq27fGw1UR0CHobmj+n7OzTnowNi3dhHD7YRjBv2o08wwFyYBI3qBR0NCKEay2pst
	ixEJdssjIGWz8qNlruzMYSdUq++6KkSJVhsoU32jW4gYSFkkKrY6X5ax6i34bZMywhGbrxyiY2N3Z
	mag9/cRCkQ+RC43l20qAI98hJ5TnfBlSnoTkq5xmL0VxdgFhyUe4GbY5bnqKLwAlRYElZnyTptJLA
	C7LAeRhgBchxRgUWcHqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnCvW-00C3VE-2p;
	Mon, 02 Oct 2023 07:01:10 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnCvQ-00C3R4-1K
	for linux-amlogic@lists.infradead.org;
	Mon, 02 Oct 2023 07:01:09 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3247d69ed2cso5524793f8f.0
        for <linux-amlogic@lists.infradead.org>; Mon, 02 Oct 2023 00:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696230062; x=1696834862; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JY0pGPase8DAPqfUfT8zLIwupYNhs+ANJOrUn57BoW8=;
        b=Fu8SEG82YNxHIB3+n/zoiToy8CKVRA8xp6/vLBebuOJukdlHXWs8buRX8Fzo5belsS
         yw37Oo/Fbxg5x45pVV7vM6/dpP52Edrng+/72Ifs9E/dLigwFsO+DUZqfK7/qtFC3Sok
         yUxCRJ7cStaaf92NQDUQBCu+wKgmdYxCr4CnbaFV3/qv8ZXV3FA1Pbn65sfpetTCNGvz
         e7SprEeIfHFE6d9Ro3xYOepGB73olDQ1qG2VbhGGvgKOI6mSK+8Wc+nbuDAbdb0exSfT
         k1PecBSAk7UMWMJa1mFlZ1TUQipwpARrxAuyNh6xLuF6Ao5P3fAa8XIlihIIjXrzY3rj
         t1pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696230062; x=1696834862;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JY0pGPase8DAPqfUfT8zLIwupYNhs+ANJOrUn57BoW8=;
        b=K60OGAU3NJIdL4PLxwsKz2KBMgKA9QZa3+d8rh5nB5OYovGIFoKc4V3yn73zUj8Ulh
         Casv91El1ywrOx3CW0KoS/pu3YS3KjsgqWoUVBq1NbrEkO2l1leZnuLPPsJtIFo8CUgo
         +XcPTqUdH0WwnQWHfXLbDvARXrlMKkeFOQZ0eQyQZo7q48R8E+RVTpxCT7Yw5iP5YgXI
         cSyH79TItY45sQLpBitDfJBTWhCNJd7fCrOspUXAnv3S4a8QZHE/eFSFA/pqLvIvFC5K
         32Iv+dTdGv09DRIh1KUsS+UPVI3FAGtyHhy3Qc0YS/aFKDV8KUP4g9Ie1Gxs/8/SLGOQ
         lgkQ==
X-Gm-Message-State: AOJu0YwqBUggm9LVe1iGRqXPAabsEOKhkIFDuzH8t9YcCnMEKopjd2NA
	b+OFrgZYUIrJh3TcZoyPLZSCTg==
X-Google-Smtp-Source: AGHT+IFaCMBuWg5TQzZ8F+fXy536sYD86fhXX3Qt7RMVopoYPkSdFbYvPmBNx/iZzn+a2xlQnqMhFw==
X-Received: by 2002:a5d:5151:0:b0:31a:e772:ddf6 with SMTP id u17-20020a5d5151000000b0031ae772ddf6mr8873550wrt.39.1696230062112;
        Mon, 02 Oct 2023 00:01:02 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id r17-20020adfda51000000b00327c79ca7c6sm2440715wrl.80.2023.10.02.00.01.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 00:01:01 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Jerome Brunet <jbrunet@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org
In-Reply-To: <20230925135326.1689396-1-jbrunet@baylibre.com>
References: <20230925135326.1689396-1-jbrunet@baylibre.com>
Subject: Re: [PATCH] arm64: dts: meson: g12: name spdifout consistently
Message-Id: <169623006126.3465675.17408655598798133472.b4-ty@linaro.org>
Date: Mon, 02 Oct 2023 09:01:01 +0200
MIME-Version: 1.0
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_000104_451794_7BA677B0 
X-CRM114-Status: GOOD (  14.77  )
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

On Mon, 25 Sep 2023 15:53:26 +0200, Jerome Brunet wrote:
> g12 and sm1 are fairly similar when it comes to audio.
> Both have 2 spdif outputs. While the 2nd output is named "spdifout_b" for
> both, the 1st one is named 'spdifout' for g12 and 'spdifout_a' for sm1.
> 
> Use 'spdifout_a' for both instead.
> 
> This change does not fix any particular problem. The intent is just to make
> it easier to have a common card definitions for platform designs using both
> SoC families, when spdifout is used.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.7/arm64-dt)

[1/1] arm64: dts: meson: g12: name spdifout consistently
      https://git.kernel.org/amlogic/c/3f0b916f3a7eaa8aab6f6ab465a4f5342b5253c7

These changes has been applied on the intermediate git tree [1].

The v6.7/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
