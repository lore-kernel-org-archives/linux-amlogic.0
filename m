Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97823D29FF9
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 Jan 2026 12:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZwOgC6zueb71d4r+DIysP8C8OWqGrGYmHza98jq0Ma0=; b=VLSQTgKpIEAyCP
	XV2Mo/+5cgSzFHKpNq7kPps/S5es0lzcNtjiyO+DkqczkaeWkTLdDGGiNe1UPOD/4FL1C/4yjiDdr
	/2kL/7YwpEQ32R/mknhUEW99Y5JbTL1Esu49qgAz/u3yBVr6zFFGK6qCOhpavngFh0X0n7LExdTEn
	m2Zn29I2rdtwxAcYQDSA6PtpgIslVZzWUF+tvem42qxSWq08QiEoP6uPo8WTGZohIz1riWLqANv5K
	38l775EFEjbAqDxzz4N31kgZ6MUcx9R7UjHOn9ro5aDJ3KCbIRlAB3O9+J3xMTeKtGBZl19Ie3YgD
	zXu2FbABQPYhd0Y47YLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfzic-0000000976T-396C;
	Wed, 14 Jan 2026 12:11:22 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfziU-0000000971l-2sAA
	for linux-amlogic@lists.infradead.org;
	Wed, 14 Jan 2026 12:11:19 +0000
Received: by mail-wm1-x342.google.com with SMTP id 5b1f17b1804b1-47775fb6cb4so47556895e9.0
        for <linux-amlogic@lists.infradead.org>; Wed, 14 Jan 2026 04:11:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768392673; x=1768997473; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZV3yspuFeXD2fTCOA+EG8wDsgm3hE+MlvzRhyE8iDHU=;
        b=VTgeT1S/Zqk9D1ZQQeIUJ5r5UR36tol0jYkx5pMPs6XOlWNfDJv9Q7om+p1iBy1EKI
         rzNnfHW4oWCE7MFiguVEOrYM0ycYdwxmUXOnPzpOA9zGHNhhjZ3ihGpRpMy7bo16XaSO
         5RtiM/OJot+N0OxHHEZCcyGssi4YyMxJLrRG/6osxw02wVwQk0MKQm4fRoGPyMjfgcG3
         lZ/Udm0LOgXDzs/Wtea08L93Ds9ILQjpznFfxW3nGPNapxn+LZxSXtwuHIcwWY3wIRB2
         RsRaxWoZc+381TI2Rl+/BtV4n1okx81xaAau9qTNdBVTds73OaO5qzk51EZT3Rhnu3TG
         ciJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768392673; x=1768997473;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZV3yspuFeXD2fTCOA+EG8wDsgm3hE+MlvzRhyE8iDHU=;
        b=lNtHuVa2EI32bWxgABL+68VHPEsGuD45BcaKBNTOLMjjjo/e22ENhebj3Sl87KN62/
         GkNwZcbE2UjYvC/m15+Dw8fm6dNjblZvBkUgJmu9AvobqmUb2+xEI4OuTZENAqCkjDGq
         YOC/EYkX2JqubyDvx9raifnZsYWts9OTF1OdXFe8TboySaLeaiDojNww9G/zGw9vzo+d
         3CYOPG3ulUEbW73RSyySJ8qkqL6k15swGsV9KlRSh+OthyGayGL0YBtZx3rrrAyAT3b6
         Nel0aMZBFza/iIsiyxzV85KmToQIerEvB20ApRAdAWoiAt8nasKH28IQOJ8SYGcHCgwG
         cG1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXN+eQ1kJGj97zue5AUktDBjWfhTkh3vDISp7sd+YHVRZPWdUuR/IW8n1+lE7s86rntkNPXTABa8R9pTskp@lists.infradead.org
X-Gm-Message-State: AOJu0YxRQRhqlKBQgcvAeNdYW2w2LHwxKxizY4RkoPLMrs6CWl35ftmX
	KAUwPxJOt0QolAzgxGVVVP/Jwi7bxXR2Q18xwj2Dz7vVSZzG3ZtmJybKyaywMtIEMlT4PRwmfZg
	vJqjytZo=
X-Gm-Gg: AY/fxX5CfLlDXCGdsfWVei4mNdovvVWLeW2d/2t16y1wg8KNOx5I1t4all1+z68ccv5
	x0xNz1nUQUea6aHaOhfPqUhVh5lEgoFXNwdUOr/zvSJJv2s3GM5WCHVX4r4Hpi4WXdv+dF740Iy
	ilaqIcTfOLmVZuyH3BSn0Ri+uUBsQ6YCmIrsUJR5lNB9goiTuKzqaPbCNaU0yDC0JekOWvxitFs
	8PzgWDuJguMbCH/JDk9wZjofskuJ6i1+UYyeaqojY+3HztYsLWsvXagWsimtpJY3fWiZpCrPcb/
	cZFMqpzPE/83wsN7nymNnnDkSOIOXgghVTXTXocxUvOwUFYJaIUlJkHKEnfRLcGcyQRNy8SD6DP
	tcNnkvvr0vKkialwoIWxDaRrfL97i68ZmOv0tC8RDQmJj2FdGr1aGEfowaOjpxz5mlLvw8mdtoT
	+c1B+j9N2c22ids9eeqQee05b3zSM2r/hgQSjwycfSMg==
X-Received: by 2002:a05:600c:4515:b0:45c:4470:271c with SMTP id 5b1f17b1804b1-47ee339455dmr25970885e9.18.1768392672997;
        Wed, 14 Jan 2026 04:11:12 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5fe83bsm50158222f8f.38.2026.01.14.04.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 04:11:12 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260114-amlogic-parent-clock-cleanup-v1-1-31078b1e4a2c@baylibre.com>
References: <20260114-amlogic-parent-clock-cleanup-v1-1-31078b1e4a2c@baylibre.com>
Subject: Re: [PATCH] arm64: dts: amlogic: drop useless
 assigned-clock-parents
Message-Id: <176839267224.2837299.13824498685588807202.b4-ty@linaro.org>
Date: Wed, 14 Jan 2026 13:11:12 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_041116_490238_88C0D598 
X-CRM114-Status: UNSURE (   9.44  )
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

On Wed, 14 Jan 2026 11:57:40 +0100, Jerome Brunet wrote:
> Amlogic sound card assigned-clock-parents only have <0> and are useless.
> Remove them.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.20/arm64-dt)

[1/1] arm64: dts: amlogic: drop useless assigned-clock-parents
      https://git.kernel.org/amlogic/c/126058f8d80aa7176bb230ca03ec939a70435177

These changes has been applied on the intermediate git tree [1].

The v6.20/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
