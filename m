Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA4F6CFA466
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 Nov 2025 09:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RD9Kf1BntkKMPXOcZCkMVsbVeBG4uwR09C757VEmG60=; b=sMV2t/7doK6Bi5
	CGGtcFBCGvUsFZCoCPi7oQBLi6Vqah9wNh7EdN4dCXksn0Ou1TbT887rZOLESw25/jdMU16X3WQx5
	fBqVUt6rIm0YfebaaM8tVEG920JG3BvTYzElWcsGiYuNp2ZzO6Iof9ck+XhbGmrkcITXkRgYA5XfM
	57FupF8/CZQhfk1oN/O8IdXBmQR7eSoK+E4rDreYB3T0c5j1WRsGGDauCXQMXJyLtQKUDP15mSMiF
	LnLMgWdbL7OUuirp3/xhaFV0GsHA9JGiixZc9Y/KehEn/P0fXx7W6SVNLNiA2S6t77GbOordFchzA
	agZrwrfAZBF7pHrhXPtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNTLT-0000000BOT3-2jrP;
	Mon, 24 Nov 2025 09:58:55 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNTLQ-0000000BOSF-48Ac
	for linux-amlogic@lists.infradead.org;
	Mon, 24 Nov 2025 09:58:54 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4779cc419b2so39024575e9.3
        for <linux-amlogic@lists.infradead.org>; Mon, 24 Nov 2025 01:58:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763978331; x=1764583131; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=StnX4Pm5rfx0J+FKrbJIz7Gg4AQJHV9UVznv4XZEdWU=;
        b=NrgyrGiLBIcp5TqQXgRdix/Iqk/0O9zIRiX1KC+M1bgDN23zovcY/pmgouT8JfDdmb
         PK6+aXtpSORsIp+cMyrf1N1SjQ7anjnCHTLQ6CpuNXSbdYY5ryCNCDKgcsVzyv8eKIV5
         dvdIKDgQ/4WJbe0LiVUW1Nqnq4evyUR6bCCHPjerMt1ZGVcXgJUMl2RYULdKr5TOgE6D
         8UYcYkWHnySvOFs4qMEp+AbXldtl1WyTqVMjsWpMPG9JNZGfJqVYvIJU32TfV27QJd4J
         oYUXfKiz4TH1eGRYrTa4fQEsOjyxKN+vYLR2vTtCbY0MrnHNgbWrgCw6N2FyfcFcbvmV
         O8fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763978331; x=1764583131;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=StnX4Pm5rfx0J+FKrbJIz7Gg4AQJHV9UVznv4XZEdWU=;
        b=rpE3kjLmLgWXqRAhOg1rrRgia3YV4PIacjY94y8Ce4wmYuRknyCNy2Qk6T1K2p5SeV
         lSyrvHD6auNPCoR4OTfaVkFSBp4bIpQqFZP2xeaGWGv1DdRoHYcJQpn7Lq+4p3utiMS2
         wn7EUEIoD6pSMmi+tpPwxxnPTRmkxvXifvn+lCsQvNUzX88h1vBQEpq8nS9+7I8rA99L
         BWR+OdN25BCrKT8pGT1k+Hx+9k17n+qtfZAf9DwEG6429WKnFjoZb4Ykw7LCs8M0rUxx
         vm/w/Zr/lsBsgVtB6wEsBNTW5TkdBAP80z2lJSFb0gJ+AnUkxTOjfhZ5NfIo+uhXBdlG
         JGzg==
X-Forwarded-Encrypted: i=1; AJvYcCWJxrsTnfWxdmshF23ISgWbVobRPVoLYvzSCdmgT3GW8803ar++lilTK5rNro1Qscw8pY5xWRp8qDLJV8Ok@lists.infradead.org
X-Gm-Message-State: AOJu0YwudW3b4S9VE2FAhNeqd/JqjXfaPY61MvsD9MU6vrxziHM7JRKV
	QHGHSHbRtD5tjzzFgqbdcW2R0j/GvZ777d7mcDPhuTscgcs4XqBBPwl8kZ+axKj1OFg=
X-Gm-Gg: ASbGncs3ji+LuS6lv737nLDuwqo5roR6IQNmZmTSdGJhoSMuFkHRurupIRYVjV3/LTX
	x6HLI8RoofMN9NP+NFScKfYKhiUeGVammcFiMm8g6XtPSDUyci8Z6AkI2G7nkmIDChEsLS3E4cx
	JXKUOIDVWmnQnuyJKLr7pS64LSILPsDuJ2nQPL3lq0N40A1cU5mjekVaSXjztzFs9T/U3egr9lw
	0rTYdsEmnNCel+DTntg5YdS89m8z2AjQY3ScGa7ywNK6CeLdD+zLdixJGV0ExQQol76sV6RCing
	Xb/1POkFp1pwKX2pzGoGliXk7s6UZuTIfSGXpotaU9bpDR44ZxJik0x/7AZ79KFOsbZsNrb1rPg
	IySLJA+HHvuCKNsr7jVm8LvU/vKBrbhPWQcGIpwzttJkzv+FZ+VQ/HnZB6GKi2xA/7OCLEHZvUD
	bWuMzrdC+QKevN0TZApejp2ablyp2k6LeYej+vgrVdkw==
X-Google-Smtp-Source: AGHT+IGob8YBtobs0cZ6JHHYnC1RWGcF327uC/39s+XgiBw48PKNrpkNepBppOcnXYAOHrXO/pc1lg==
X-Received: by 2002:a05:600c:3543:b0:46e:1a5e:211 with SMTP id 5b1f17b1804b1-477c1143046mr93368805e9.21.1763978331169;
        Mon, 24 Nov 2025 01:58:51 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a97412e3sm143621875e9.5.2025.11.24.01.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 01:58:50 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Anand Moon <linux.amoon@gmail.com>,
	Guillaume La Roque <glaroque@baylibre.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: amlogic: meson-g12b: Fix L2 cache reference for S922X CPUs
Date: Mon, 24 Nov 2025 10:58:48 +0100
Message-Id: <176397825606.3590190.10935817124468233062.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251123-fixkhadas-v1-1-045348f0a4c2@baylibre.com>
References: <20251123-fixkhadas-v1-1-045348f0a4c2@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_015853_048014_E3718CF7 
X-CRM114-Status: GOOD (  12.35  )
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

On Sun, 23 Nov 2025 18:14:10 +0100, Guillaume La Roque wrote:
> The original addition of cache information for the Amlogic S922X SoC
> used the wrong next-level cache node for CPU cores 100 and 101,
> incorrectly referencing `l2_cache_l`. These cores actually belong to
> the big cluster and should reference `l2_cache_b`. Update the device
> tree accordingly.
> 
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.19/arm64-dt)

[1/1] arm64: dts: amlogic: meson-g12b: Fix L2 cache reference for S922X CPUs
      https://git.kernel.org/amlogic/c/79482f3791c4760b9b0d8d9bfde9f1053ea3dd5e

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
