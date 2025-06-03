Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A902C5B555
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Jun 2025 13:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9Fhz+ZSaxXEA98tmi8Fs7vt5cAXOh9C431bJLsr+NYA=; b=nuul5lOavWJvQB
	VzVdQ0t/DcGgelEbvhL1YtDiZUSQov3i/zJr/UuhtrP3Hr7jmmRgNRzwGsb4B4jPJWD0+0qOR7n10
	BkGyZ16mHuDEN/N7+tS1kCNYnfQj1WA4BDZM15LUlscIJc3IIzvGbarOPZHM3a9+wdRs/rr1fZH/C
	0ib/A1zhynIjvBj5020VfYIcFbCcNZA9vPK5KrENAfvoNbNhkYhub0ZNLm2Z4pi0wfVDj5SwO6N4V
	xmQAnZp6gozkfU3u7PunXppj+b9FdBM07zUz71rlpn953nz+5FgTDyFBrAd165hQFnaRVkl7zHtLM
	1HOyAFMyh3VODLB1cQ0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMRhi-0000000B2Ee-2mch;
	Tue, 03 Jun 2025 13:29:22 +0000
Received: from mail-wm1-f53.google.com ([209.85.128.53])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMRfW-0000000B1yy-13Ne
	for linux-amlogic@lists.infradead.org;
	Tue, 03 Jun 2025 13:27:07 +0000
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-451d54214adso22644855e9.3
        for <linux-amlogic@lists.infradead.org>; Tue, 03 Jun 2025 06:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748957224; x=1749562024; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oihVtB+1SEPxR6wMy6kxrIZOmkj3G4LorB9xvDbO3Qs=;
        b=JB07zlmuI+Zrfsq1xEhmCkjdbQLjmC6WZ3+lYhlUeKwwGQs3OXseXB04cZ9YpkRg5z
         Xp/d5gEWnrqbIHfoc4Z7fj8notY+jKt2yKltC0PKrsW0QcfURudy7hoOmOL/klNXTrSn
         k0Taxgy8/0xEwjedVI8AN8f80j/gVBC9nkMLp4+qOMcM+TJIXRQYTs0p6X5YjIV2VbEL
         CyTml7YAzxCmirn6nLXlVujUFMGbjZ+UtMxH38ybVzVGKtNo1aGO/DW0fHH5lLwCiAbd
         M0CIapUDzQBpVJkEDtXcXb9ae7dCLzSMwVDvjtC4bc8QJUTCA2nm8ufcV8xr6pZ8gW3R
         sF9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748957224; x=1749562024;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oihVtB+1SEPxR6wMy6kxrIZOmkj3G4LorB9xvDbO3Qs=;
        b=Z6XD87ES7WRIKPRLQWYMOKjHAzw2mAIbmwGCImVZfZ9pNeQH8ERaSPFber2AMrUBxC
         gRKc0xOirMkyUfGvxHxehO9JkOLzknQdUYSW17BtrsieilmddrsneffuaETqMitM8JhT
         chEo3t7g+wlBzbp59cLQmTOWBUAU676hV26CARAzme8V1d0cYMkLSnJcDXE8J7mLUCRz
         VgnHWTe/4e7SaES3WNwLfgRu4zJqaLOaIZceOhxKus+KHsHj6dmb/T6TJYeTlVSFb/S7
         JGQqQwF1EcesWbqrMl6hoCeXlAAYoCeqjExkLhZ8yhjMkpAzJ/ukmq7Y9x8v7McpOCnQ
         zIkg==
X-Forwarded-Encrypted: i=1; AJvYcCXiIE6B06elP6js4Pqd2MM9Djpf5ffks0gvNE/AG5kIR36YWm9SU13Wv3imZUA+bIrq1E7zdEcdQutmQYYC@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0Op3MBkqJVmujye9QKsMyhyhCR2vQJMcPyGjTnR7Lul0SjPiB
	OChQenWawZ0hUIab+BX7tak/kkPEiByshdGHE3S7s3ROEDfL9gFzw9NEt0h6+kwB9MU=
X-Gm-Gg: ASbGncttNQDOsSqt2G2aIVree/1QecBADJsxVRNMg60c4XI6hrfZJ7n0vnOQN94aoSV
	ZyRO/37MJlVpvPIgTH/yzmVxyN+RpFkLFmWK9r/JzfOpSMMGKXWQkek9UoJTb5w+QP1lk2tHRtk
	wflWtQFRry4tp2eFBWQyQOk6MbCs+Cr2KjppOx8TsczNTItpxfuwgJmVcHZMG5SdxTBaLlSFsH8
	Dg6/2IgZa1OhKglGnn0D2oKLzc14wg6n4fxQ+m241TilzhB+F9xZ86B4L0R3GIOuamt+Gzd9sOq
	pU86i3ty4c/eCwtri9SPMRrzeHQKp4e0ZynZzrWcmUNPFPpxYJv5VWetU0WpC4x+2tp8lrWFvCZ
	v5AMtCVI=
X-Google-Smtp-Source: AGHT+IGa7mbwcZXtdjmxN4fEKLTzriqSJh2XpWZKE/sUSl2iqQEeeTppliDDInLxLyB5zAkgBnX6bQ==
X-Received: by 2002:a05:600c:4e0b:b0:442:f4d4:53a with SMTP id 5b1f17b1804b1-450d64c322amr189283025e9.2.1748957224078;
        Tue, 03 Jun 2025 06:27:04 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d8000d8csm161701305e9.24.2025.06.03.06.27.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 06:27:03 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250424084721.105113-1-krzysztof.kozlowski@linaro.org>
References: <20250424084721.105113-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] arm64: dts: amlogic: Align wifi node name with
 bindings
Message-Id: <174895722336.2922018.7146209463305009352.b4-ty@linaro.org>
Date: Tue, 03 Jun 2025 15:27:03 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_062706_283404_64CE02FA 
X-CRM114-Status: UNSURE (   9.59  )
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

On Thu, 24 Apr 2025 10:47:21 +0200, Krzysztof Kozlowski wrote:
> Since commit 3c3606793f7e ("dt-bindings: wireless: bcm4329-fmac: Use
> wireless-controller.yaml schema"), bindings expect 'wifi' as node name:
> 
>   meson-gxm-rbox-pro.dtb: brcmf@1: $nodename:0: 'brcmf@1' does not match '^wifi(@.*)?$'
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.17/arm64-dt)

[1/1] arm64: dts: amlogic: Align wifi node name with bindings
      https://git.kernel.org/amlogic/c/117993fc40d96ee3a7697d916a2a0424467e9dcf

These changes has been applied on the intermediate git tree [1].

The v6.17/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
