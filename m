Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAFD8C001DF
	for <linux-amlogic@archiver.kernel.org>; Mon, 31 Jul 2023 09:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4StdQLGleB7sUkHjU2Ey2rCE61McVIgnTfwa+fG1zYA=; b=JvnQyXfQPxeh4y
	YWpF2/4wIJjn/C+39BirXxgItUh3fWZzevnmSmxp0MIqMh7Gqmgtbj+7d3gmGttksjdrSS+E5UJcN
	2tR2HfawL5V/Wz0m0ojSFbcNFzBeUlhG3e6Td4L/cJ8c+RsUibmeDgbw7pNSRr/2fh8iDMrJgt3V6
	iv1CuP+JtnbO+3R6pPUMlCCuYK8tekjGN2ESm5u/xhc9ZFhGpqo0+SikRjmxp4Qv5OYbwwTIqsZsB
	QaX1krpFRfYlmkUIgwbTKayJaQV0SzmouFNp0ba1zjdKK29dN9+ZbNKJLc4pzGjCSxvbqeHJ8bAOQ
	+uymW7XYhNityRi8I8kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQPVZ-00EpEd-0z;
	Mon, 31 Jul 2023 09:48:09 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQPUb-00EowN-2i
	for linux-amlogic@lists.infradead.org;
	Mon, 31 Jul 2023 09:47:11 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3110ab7110aso4513428f8f.3
        for <linux-amlogic@lists.infradead.org>; Mon, 31 Jul 2023 02:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690796827; x=1691401627;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=asm9zeLSnj+DVNI/7QpgE3JFU76xoN5im/QuaTgnZIU=;
        b=z37yyX/XzZJlZeZ0lzPgzCwwAL4KvWqVFWgPuxUP4JivmOT3KEY5SrB3EqOjeCkZi2
         byQkVzj2GMQ0k7SrTsn/8gb9zydO866wgbTOZR9qDiezhMvm29h9cdWOJqumB4dCHVSw
         cYO1mZAGNrSh/dnRbaTxdOwRaAaz3FluTVhmnMczAxM/bp80pTeTneLD8XLxvsuD5xGd
         1CXphhUCDq/Vp7XWer5nS4dIUjLCqknd7piSejiK/18clTqs9Ovd1LQer/9SYR8+xN/N
         RC6Q9N3v69wbY7behpuj9wGVARrtPQ+XjsTkqnFXXz8eV38OFGC3tNqCKOmzubtVNW5q
         pmbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690796827; x=1691401627;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=asm9zeLSnj+DVNI/7QpgE3JFU76xoN5im/QuaTgnZIU=;
        b=kqMp1oOpVLYiMk8JpiF1qRRE+PEl58Pn+nqPsem+TU2UzUgfMJ4WQtrCN3gE/JETM0
         z634A2mwzbvQh8kwAsfHLsTDDn1mDbXQ3TIVNyr0dMnJZR8s5xdeOQDcCZqbphu20AWm
         fYQrTGRAvjmXHoGqt338x3RMnj81lydEy3k8pqIvhlDtUJYAJ/DNuZ74MfuyXQ+b3PNy
         yv9iqZKhKR/tqoIA0CWxixW4MJbPDgc9dHLAeJYFdgqY53kVhFD3FEWKemvizzhoAQgC
         yQhK4OBgIroRQ2iriOGS9o4h5HGWxqjW0UDMKQQJETH6iUwO/Tf9kygh24h9NFaI7YeY
         SNTg==
X-Gm-Message-State: ABy/qLaj5DXS61TcyOYb3D8aLypsStFCbLQXfg4PGYGfjc9Ak0hS7xvX
	39k1rihJEZXLI00yrqp0BaJpfw==
X-Google-Smtp-Source: APBJJlExt1d8q52X9aHUegudjzzuNNSUxWFxlU+r81ID4axWBk68R+noqcm6gLP//X8Sel6ShEz8DA==
X-Received: by 2002:a5d:640f:0:b0:317:5d1c:9719 with SMTP id z15-20020a5d640f000000b003175d1c9719mr8738160wru.9.1690796827118;
        Mon, 31 Jul 2023 02:47:07 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id p9-20020a5d48c9000000b0031433443265sm12556878wrs.53.2023.07.31.02.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 02:47:06 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20230706-topic-amlogic-upstream-dt-fixes-take3-v1-0-63ed070eeab2@linaro.org>
References: <20230706-topic-amlogic-upstream-dt-fixes-take3-v1-0-63ed070eeab2@linaro.org>
Subject: Re: [PATCH 0/3] arm64: meson: bunch of DT fixes, take 3
Message-Id: <169079682605.186625.9628829620831683924.b4-ty@linaro.org>
Date: Mon, 31 Jul 2023 11:47:06 +0200
MIME-Version: 1.0
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_024709_878086_2A4B45F1 
X-CRM114-Status: GOOD (  10.12  )
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

On Thu, 06 Jul 2023 10:00:18 +0200, Neil Armstrong wrote:
> This is a bunch of fixes against the current applied and reviewed bindings.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.6/arm64-dt)

[1/3] arm64: dts: amlogic: meson-g12b-odroid-n2: fix usb hub hog name
      https://git.kernel.org/amlogic/c/6ae51d90457c93fb2e184ef02ea6f6bcf0199e4f
[2/3] arm64: dtb: amlogic: meson-g12-common: change aobus-pinctrl node name
      https://git.kernel.org/amlogic/c/7bb717411be07405cf750541b731f01fd2a1f8f9
[3/3] arm64: dts: amlogic: drop cooling-[min|max]-state from pwm-fan
      https://git.kernel.org/amlogic/c/cf4befdc463a32cb4a74ed4ca3ba60964e24f7b5

These changes has been applied on the intermediate git tree [1].

The v6.6/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
