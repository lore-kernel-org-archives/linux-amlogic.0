Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC993C3ABB6
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 May 2025 12:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pb8YGwQLo+Tl7c45chJCzRR0Ct9Wuwsmwnv8+sRzSTQ=; b=m+2j1PDcf9NDTX
	eQafd2FxgIE9ieZGU6t8nfZYt9Lf0YlKwToeY3lWKL98r8UzjbGlsjpz5ixI5UFF/3idyk+era53k
	/hR3zSEaHE8qFOxQpsg92s1Hs5qgzBqkFz0DMQwxHzYNXapSXYgzS2QfRdk9AN+VW9gjygDqHCQ9m
	3rv78FY2L3E0ucSm5RjqYt8EqorUVcQbGxeXxTP24dO2VJaEHfUVQURtDqxviU122R9W9buzny7aw
	PHPr7t/CE2VvFF80RD6jc8D4P4Z+RgozOqezLvGXDp7KJrFGY1SH2LWgVoIGmJrYaSfBk426+bWgX
	KDledV38KFiHJz0KvJrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBvBO-00000007NZM-0WgP;
	Mon, 05 May 2025 12:44:30 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBv3l-00000007L22-2zrM
	for linux-amlogic@lists.infradead.org;
	Mon, 05 May 2025 12:36:43 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-43d07ca6a80so16073165e9.1
        for <linux-amlogic@lists.infradead.org>; Mon, 05 May 2025 05:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746448596; x=1747053396; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hpeTr6Unq+CiFUgnvKuAHal9BTXc1yrzMKrqPlgz8m8=;
        b=JmHa18lmDVVYa3WJC1I49xT74sVuhyv2K55RdgQ3EhC4FiEMWlfg2bIsQrrPOM3Ho4
         4e7CZxbWN6KK1Qm8qd4ILgZp3aRDkP6NqGPfHeDj9FIOc2XtJDet0i9WFzxfsONXxcZd
         d2H5XGIuh7okC6dFVIh8E8si1jAlbRt1qMeEL2RBU/i4aWndriLNFGwGbNmYnuPxevAD
         ax1qG9bpU98VdOEltZl/53Bn/+IqhBl/ZXHOpxtzUL/TOl0ig0nwO/v49pht+Qe0Ql5q
         +YFDTHoiJSO1qvrjMzrP56TuoPgwWeAwS6c20F8Si3iAWy115SIXWLW5IX+GwwF2q7xE
         ZpMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746448596; x=1747053396;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hpeTr6Unq+CiFUgnvKuAHal9BTXc1yrzMKrqPlgz8m8=;
        b=K97tJoXsqBrbIK+zStrsRCdpMLWME5vA5TP27PzfCY3Hxr5Q/UlJweMvq09oXtgQPK
         ASwX0HiDjW3nsciwWnUPlR+JPCLLObJksHLbNrBHDadOkcpLH/RT+wncp8GI5UI1H11+
         2ZMO5XJh5iYVxE+RfGZGUtlbkznF9QqBL9kA1U5lI2xxFsKeykCpuVkhoRItZSgChSHP
         6ZymRGnP7oBXCSHLNpoP+XSdpq55CzLHFkn0h/lCAp2KMdq57ZLOjfLm/sJxT3tjHor4
         yzfNbRTF6OLkbptcsfkS8CfRlMv9/+GjJUapBLSsJSSjuHByne1lMMMpheeivzIN76l6
         zYSg==
X-Forwarded-Encrypted: i=1; AJvYcCVf3eMzgg3OJ2GMmafVrTMD8xhCu7scgXF2N1eLs/eAvHCDqqcQdSUOKM/jonLrlyn/gz86RcUDZjRciJRT@lists.infradead.org
X-Gm-Message-State: AOJu0YwLQ85gtQYphYrLh+/aIyudhgUAy+2i4Q5wC5mW7jMn8J3oKujE
	R5TWXTT918x8Zbmo72TnmV1WPLG2wijBCK5hLMsC8LtL6ZTM9XL1k3BjrQSFAxwhV6MVczLHCNI
	2
X-Gm-Gg: ASbGnctTDPQoe/5I1jNDEwQR0ayYidsQ+9pxiZiSwjJmxBp+QQoD9PIwhoFK//20WAw
	Ult8YIO3IPhSvmzfJlG9KISv4ufoBbcZdCM5Kah9HGbJ9myMRoZSlAOzghQ40ZXSot8rGHcCbVX
	J+DtP+p9Latub1Rhchmq8A3aflAw78nSEPBZjPHyFS3EjaW/G0tCa+UxjuSA9eWLg7pXMCpmgIR
	9u58GYiklURs80dcQHAyW2WlU65tkNrRuIyZMaBeGcFY9YnS9q/E7XNSlMG7vU+hZF699SxU19l
	D4zEiQ8DaFM0C3OmlHr+NLVnGcofCsH5NTvRvMcTabQbboUkVKSb2RsNvEb6HUK6K7TKg+rG
X-Google-Smtp-Source: AGHT+IGd4vciO1iWM2MZ33WYuc9Z6cveleoL1KHOCLqmcEBnu/hEnCR2SmyiZj6jI/P6HFxT77OnRw==
X-Received: by 2002:a05:600c:1ca4:b0:43d:db5:7b1a with SMTP id 5b1f17b1804b1-441c48be0c5mr57583835e9.12.1746448596076;
        Mon, 05 May 2025 05:36:36 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b8a286c4sm131072725e9.25.2025.05.05.05.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 05:36:35 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Da Xue <da@libre.computer>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250425203118.1444481-1-da@libre.computer>
References: <20250425203118.1444481-1-da@libre.computer>
Subject: Re: [PATCH] arm64: dts: amlogic: gxl: set i2c bias to pull-up
Message-Id: <174644859542.1377721.4181662111472881192.b4-ty@linaro.org>
Date: Mon, 05 May 2025 14:36:35 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_053637_759594_FE7C906A 
X-CRM114-Status: GOOD (  11.20  )
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

On Fri, 25 Apr 2025 16:31:18 -0400, Da Xue wrote:
> GXL I2C pins need internal pull-up enabled to operate if there
> is no external resistor. The pull-up is 60kohms per the datasheet.
> 
> We should set the bias when i2c pinmux is enabled.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.16/arm64-dt)

[1/1] arm64: dts: amlogic: gxl: set i2c bias to pull-up
      https://git.kernel.org/amlogic/c/16d4daa00ee69a43a4c79000d40f9271c85f7879

These changes has been applied on the intermediate git tree [1].

The v6.16/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
