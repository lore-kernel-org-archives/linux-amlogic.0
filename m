Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62900C531DC
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Aug 2024 15:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MI7e0QVy4EOTHysphHRLp1o0VP1j34h2sn+Z1xHL3FM=; b=VCkTKp56Tv3EPD
	FujFkGbATHXwHGi6Zlcxc0Q0b5q3HCB4BqY3gBOcfUSzIvlAkHmHBvskMRMB1CPGtJSn1cZx9yi7+
	GK7rj4fcpLg6kmLztk5MSV2YC7lzZRfnfS8F9OQQaApMFKkv7+NUV0Ki3sAhaZ6S08kA74vBnIBzh
	BK3EUsQX8QcBeceP0KJElR9hVI/AaDRkkE4kH16KjWtpEIBttdy4Dtranbzg73z1V8Q66k2Fd7iTz
	+hp4/ADcWQRrJCF3NybtXePMBvo35bTaY9bWtLz8vEMRKub3Ow/XjoxyzLKVcX/eOK+Kd7aDgQ1J0
	GkkcCWcWAsoJxpkOQ/oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgQpP-00000005qTX-435L;
	Tue, 20 Aug 2024 15:31:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgQp6-00000005qH7-2Cdu
	for linux-amlogic@bombadil.infradead.org;
	Tue, 20 Aug 2024 15:31:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=3Ur/Vav4aBUf1Kq1Kuvd977BxSeEb3EWBoV9+RH1igk=; b=B5dO77fkosQmPyGEStyFqtyAJH
	G8rRXj+rl7kyZ+TA/giojfv0TgK4f9mJmSqlxEu0SHzlGEuOakaxhmeR0Riz0Ea/J4Zh+a3/EXU1i
	PX8r2USop/vgx2lj4F/flgpKrdO7dIcufj1+TzrFqRrniz+UhbKBo5cyRbeq4AyayJSTiJwzQlCMz
	c1E3EB7PBHv9dtvErpxz5xvI8/mkx5htXQzyedtQf6u+ptwRdHmgAOlnBCutgm7vfrkAE1B2UVTdA
	3XUoqL8ztyeYDYsSmq8X8ogALyuVfSpzI2ObQ+H34Cb1fXV+gLGvgsM+bzEsp6IsEKMjZewjQv0GT
	UwyCFiqg==;
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgQp3-00000009MIo-0ODV
	for linux-amlogic@lists.infradead.org;
	Tue, 20 Aug 2024 15:31:03 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3719398eafcso2906723f8f.1
        for <linux-amlogic@lists.infradead.org>; Tue, 20 Aug 2024 08:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724167858; x=1724772658; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Ur/Vav4aBUf1Kq1Kuvd977BxSeEb3EWBoV9+RH1igk=;
        b=E0GRTg14ZszzRS9AY0avO6e6Ev1PmfUzrwxDvM2UPxpeQKtCIoqKb1vII9FMqILIRf
         u2+/+vJxYvHVEuJQzN1uQ5JigM0i+Rty+pkXz5jDMTC2KsdITcIXe8EZTfPPvgZ5ENAM
         ABND0k/pmF6sdhsGL6HjvRHAxrXb2oSslvqQii9yNnmXZxkSD2gJRoIkm28THwLURgXf
         imKPQUjvVanQe9HE6ZIyIxJN2JCl+nmM+56f0HpVHBFivjngxZCkqIgI8cC1LgPt5CyB
         nqxeIU6WOVwznbKTzZJfRfR6rndh3bBH9GAelTOHmRhZqDw7wE2P4H46YA6HOvmf05mD
         Z97g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724167858; x=1724772658;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Ur/Vav4aBUf1Kq1Kuvd977BxSeEb3EWBoV9+RH1igk=;
        b=wyw9N9x9bnLQMS2xR++L2WuGX3oJ3Zx5Xvv4z4/9ldUq6ti4xlXVGptds/O/TcsBac
         vanfqI/2h/gkCPtMRQL9adMySypdQBlIPCSI5XqQGV0ne2PDGR5oHJ6RFsluFwiVNY5e
         Gt0r7ytJBzZnJk2XtoiOtGfEB0qYR5V631c/vSda92raFtrUm31tRT3ozZvkqnRK6KLi
         wPq7vgcFAA4IIFKGLHmRBxmQtZSe5/XAYdAk0WU3JtHF8GQx7j47Z1pfcDsgbdOOGq/v
         1TLFklgCl/0W+tBnEmuonazm/cM3/zbtA2loKFqYe2mwAeksoLff/6rSkusrId4xOQd6
         SKXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrD18chRF9XeJ9NgvvLtreH2fxyrgoQBCkRbhPqndaE71MnPRDwH0uj70MXScMBb5cRHGtLUQ7UvjHeLsAsjhHFyxYvSIlSIblABC68FAzBf0=
X-Gm-Message-State: AOJu0YzjMAauEwBpKLAE+3BYmPN4GzfLbJ28Opw/KYlgJyG+nNHVB0/D
	xYoSgAt2wf9UgkA7OR2N+5JRvExNaVmeTqk+OQ3w+x5+DZZlJTY0+7lnDzIYWCC7f8IiXbyMmDi
	o
X-Google-Smtp-Source: AGHT+IHWMUD27wprJqfh0nu5mP583FCFaAbKyLfpBAtWWwZSc+ciqzZ5wNroIC1wy29Wu3Iqbqy2fA==
X-Received: by 2002:adf:f0c6:0:b0:368:5a8c:580b with SMTP id ffacd0b85a97d-3719444b2d0mr10387185f8f.19.1724167857172;
        Tue, 20 Aug 2024 08:30:57 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3718983a311sm13439592f8f.23.2024.08.20.08.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2024 08:30:56 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>
In-Reply-To: <20240719-soc_info-v3-0-020a3b687c0c@amlogic.com>
References: <20240719-soc_info-v3-0-020a3b687c0c@amlogic.com>
Subject: Re: (subset) [PATCH v3 0/6] Add new Amlogic SoCs info defines.
Message-Id: <172416785609.3051192.670388660690339577.b4-ty@linaro.org>
Date: Tue, 20 Aug 2024 17:30:56 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240820_163101_348268_1DC38D8A 
X-CRM114-Status: UNSURE (   8.83  )
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

On Fri, 19 Jul 2024 16:08:08 +0800, Xianwei Zhao wrote:
> Add more Amlogic SoCs info defines, include S4, C3
> T7, A4, A5.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.12/drivers)

[1/6] dt-bindings: arm: amlogic: meson-gx-ao-secure: support more SoCs
      https://git.kernel.org/amlogic/c/dde3c64013035c9d6f0a5d0fd894a7a7e03c79ea
[2/6] soc: amlogic: meson-gx-socinfo: add new SoCs id
      https://git.kernel.org/amlogic/c/009ff80bfaec1aa3fa48bbe5e2903c95931a6f37

These changes has been applied on the intermediate git tree [1].

The v6.12/drivers branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
