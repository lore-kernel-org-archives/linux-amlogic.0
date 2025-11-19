Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCD01CF34B7
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Nov 2025 14:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wG1Q4CiDdHytYFZ1Oil5GHqCOwmmsBB2zbyMPfGuDRE=; b=emYEJL3xKPyNB5
	J3LKXwHzcLZTj3ySpkEwql6dwjonw8AExoPKjDMWjsD5+wxYXPAvruU7tPPsFI1Mzi116Mto6pG/Q
	u23scuqh10E9+K/hgaQ86qoeP7+9ehrxHSs9vqOm9qP7+R4uXp+0aUHFRUtROGh7x62U+6Qbd/Ptn
	VeJgf7w9z1Pyc4Fw8MZ3aeI3LEUu8nkJOGefM0639tjCRepi12vkk1Rb396H/f6lm3YTNNloR7SYj
	SHS9IJb+nwHQGr8u5lxm8X73FYA/0ODjjA2P9x0kCXrFaibx+ob1lrpTeXVyjH0XQkO00R5RKh7Jw
	TgWx2bJ9N4L9x6yvGBlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLjU0-00000003PXw-393X;
	Wed, 19 Nov 2025 14:48:32 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLjTy-00000003PWZ-0AAj
	for linux-amlogic@lists.infradead.org;
	Wed, 19 Nov 2025 14:48:31 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-477b1cc8fb4so5458315e9.1
        for <linux-amlogic@lists.infradead.org>; Wed, 19 Nov 2025 06:48:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763563708; x=1764168508; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AAvWWiQSPgIYwk1AWP8/6DiVxFM2G8tlxz+0kwoYwpY=;
        b=SOmJ28Wh7fLdKfpA6SLOs+5RMEFFHGn5+x7l65wsawMXzDWUdUtKfAfUh00hCgQ4xn
         n/FUdSCJLUO8cVyc/zKmf21XSotJP0He3VwO7MM4RFNMGAbFb5xkpqX0cPF8Q+a43wy2
         3C9UjsZbCRdww0QXs/eoxZCYjlBrXkl2kOhVEye9EFNiliDvx7EGAmKYg88LA+7PKwrV
         g8QFxMxRlu1wsOhw7sRMtpSkAZ8kQTYep5Fg4j4P9KCPLgx74xe+eF0O6QJx2aCD3CcE
         UeOT/goPR6iAUaDJpbUR/J6P/y3uEVcplyH7osSSbgV5TE69z+P/zBt6P8Xp2ojEg/Cm
         aa+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763563708; x=1764168508;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AAvWWiQSPgIYwk1AWP8/6DiVxFM2G8tlxz+0kwoYwpY=;
        b=FqAeejxHLLhy4QgPmRdAKH8IYA+AId04IXz37C9Vbu6XFIGCjxx0fm1WhbgPpb2yDB
         DC6HNKc87TAd0lwdXbOhyottZSxwHRYSEmF3P6fQ12kcVKeguyCWY0sLk2PQztetKSii
         UD1SZ9q66Hj3MmClb1C6SmPi3JqAi3DbrKBt8m/kZFq9MULT093RdLHMMRajtJY+81Sp
         6tamQ8bg8CHwlGuZhZobmeoMPPXV61Gxk4jD1hC0bpnUdf1RPbqY+akoGzYoapzBvxDZ
         DD2IhCQ8am+aWbx911s/zSbwkX8/znsOqe7B6YWSct79/9bVo3nRh7yCpPtrvDTZIhkD
         2nsw==
X-Forwarded-Encrypted: i=1; AJvYcCUrBP2R6joKhoKSZUg3Dioy2+bTTy1MjVIvTLXfUFwqQNSJraXnzR6h+2iGjICaVObzfDAMWRASMROSPz22@lists.infradead.org
X-Gm-Message-State: AOJu0YxBLOuqN0pXsqjwJnxiZ8K1FLhEQllw2Ow8y8yzxWd+XHWJAIBU
	zFPA03WC31KN2jNBpKSNUo9yvkpK3RFeu5k6n8rSpioFRet5FQKuw22mekPQETEFRWU=
X-Gm-Gg: ASbGncsuTTVJTeqPpYSw9hS9+HU5W2rgSGLQv1aI2zobKTs8X6X3QLxscmmJB5U/Bt7
	eJhHO/kLntfnXJ6HBV+wOnR0NQ64ZWFvdil1yaI2JPG678p/l1OmXRq8SVxtgvUccttmTCxC9sL
	32bouMe3lG/49QY0QaNUVQxU3fAF4U23mVovgH6+CTuevYgxVjSgIfrLw+QnHs3NNbSaERIwEfg
	VXyZKHcK11WpVF305EEmf2qPAmQPBAPkjxl2/y+lcdfBbAGXXacy9XJB4S69JQwZnrkNzHTf7CN
	MOUz13prxIaTG/vXRXijlDXtZ86Dk2qZmKrbT8eC3iJNQ/EUqAhaAcmVXNtWwsgjBE5wbctCjn+
	4kcYqYbe4hJVpyGiBDmFf4+oTmY2FQqn0aQWBqCRjbEVY+EbM8sbBWn+e2YbzScbBzffcLYtzRQ
	HXfrRx/fxn794qI41yqXVHjGTuqcxshg0=
X-Google-Smtp-Source: AGHT+IEwXhf12WmwbkhOzW6haSCLFbfitinhCu11eBWyJ+4WomkGncN25OlqCSrNETzoBABx8qeaPA==
X-Received: by 2002:a05:600c:a49:b0:477:73cc:82c2 with SMTP id 5b1f17b1804b1-4778fe6822fmr186919395e9.9.1763563708133;
        Wed, 19 Nov 2025 06:48:28 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f206e2sm39187174f8f.41.2025.11.19.06.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 06:48:27 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>
In-Reply-To: <20251119-soc-info-s6-s7-s7d-v3-0-1764c1995c04@amlogic.com>
References: <20251119-soc-info-s6-s7-s7d-v3-0-1764c1995c04@amlogic.com>
Subject: Re: (subset) [PATCH v3 0/5] soc: amlogic: Add new Amlogic SoCs
 info defines
Message-Id: <176356370742.79050.14585932686305193943.b4-ty@linaro.org>
Date: Wed, 19 Nov 2025 15:48:27 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_064830_104236_ED293F6F 
X-CRM114-Status: UNSURE (   9.37  )
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

On Wed, 19 Nov 2025 10:52:21 +0800, Xianwei Zhao wrote:
> Add more Amlogic SoCs info defines, include S6, S7, S7D.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.19/arm64-dt)

[3/5] arm64: dts: amlogic: s6: add ao secure node
      https://git.kernel.org/amlogic/c/fe85b8876768496196108a4c5199d084a6dc0036
[4/5] arm64: dts: amlogic: s7: add ao secure node
      https://git.kernel.org/amlogic/c/070fcd4448a1d49ddbebfb63c681766f75cd90ed
[5/5] arm64: dts: amlogic: s7d: add ao secure node
      https://git.kernel.org/amlogic/c/e490b52477b85ffc5bc8ae7124415345fb6a3f4e

These changes has been applied on the intermediate git tree [1].

The v6.19/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
