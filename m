Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF8FA606A33F
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Nov 2026 11:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=H2CN1t1W;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=bi/vh8bU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=mXKPS1Y4ZD1k9A/FAu/uVr7cY9as2W/4RcMeGNDHWoo=; b=H2CN1t1WewCxOdRMlHeIVjD44M
	0QF6KH1ykmqHnf/c6yDr/yzb8Q9ekvrMl1oiKJUC4NHXfU+j3u+SfoJD09xtjHsQM4H3BDVORNREo
	fbELH3XAf6HGmsERpbGMlSrCXmFefV4dRYaruLlqatJfg174GwWa8xA7SLTR39AMVH3xrbFiHIv+N
	r9Xk1DKPDVhuX77XPj+ei0IxDsU9rugaxhdn42BM7SyoX/Hb17U/i309QkfjX2SDOji0Ksstx6K6f
	fAKfG1Zx1aWt0bLGpO7bXEjEQUpGho6e/dA+06HGvaRFCKESNn9B7XX/qIRUl3EzHpMhPjqyAMe+L
	v5ER4npA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQNCh-00000000UMi-2dtz;
	Mon, 09 Nov 2026 11:06:23 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQNCf-00000000ULG-1s9j
	for linux-amlogic@lists.infradead.org;
	Mon, 09 Nov 2026 11:06:22 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so5832975e9.2
        for <linux-amlogic@lists.infradead.org>; Mon, 09 Nov 2026 03:06:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794222379; x=1794827179; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NNDm3p+UngqnrcyLX5Ukiw0BOrNKOL/SmJHH/8S74cQ=;
        b=bi/vh8bU3SO+Iu++96KNXACTx49lDRq/xhDBqW+xckCXlRxo3bwwCR+HGFjSaWm84w
         6sJdvjJC8/LMWe6GBgzoAtUFMHDrw0rY0CxKLtTVu23J5pIlgDWFaZxeNQ65ukMUqYa+
         bIRVMsjMxgMQJElg5GY9maCza24WOBJABq7WHCZaxtSH84DQe+8vaGlGSutOBsrbsn2f
         ipu5lASl18mVwDMewk9vT6jWVbhGv3W0obFl8V//X1PxgM3Q3+FoiDTVaSaIU9ZPKJpi
         XELRcHfaD8NKfFZSNW0aiOqL0bslM81PlvScFuN7aVzX/JjA97Ashq3AR+OV/+O4h3Bu
         Zy2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794222379; x=1794827179;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NNDm3p+UngqnrcyLX5Ukiw0BOrNKOL/SmJHH/8S74cQ=;
        b=aImaiCuN7oCzXoaO35ElSRKCISGTwtEmCKTmpWenieqMC0SxTeOhGlVt9krh6LK996
         EjXLVVLblmYLIYKlMdiM7ugLBamkRSzJWO+6JugOsRi3QaoPSyuHbYSuBHeY08+ijv8f
         VDKlci1rJweZerFIJ8YrNWNPk5nMcEUrWA/dmsG1tCcAMVb7iRR13FOrDs1kC6LHLSM4
         pwqf1yzQ3gn/PhmjEqkTALRFZvUiZfcUbqMKYvvurbFCnS4TFrtf4mVGCj+67KPVYpQc
         +zXuWrA6085IUaJaogIbrxabTJ6J3EG7gadCYtHh3YyG1IlHyhmk/IqSz17ZhGZq/SlF
         cZfw==
X-Forwarded-Encrypted: i=1; AL+hErE6I09J2IVL2i6F/NgxI8b/DF4Z+m5MxpFBLeIh7tU+nurIdSDRvlZa9aaC8UegJYI++J8h8rnIzF8IedvH@lists.infradead.org
X-Gm-Message-State: APuU4Z9CgaS55G2fdZYX14DJ+JBLmberFdtIzanC2b3NiJXY/OmWDQq2
	mN7aLKIA96hoUHaqA0/855p9rLq8SmpA7Qb1BtZ1qRcL6TDWRcrW3LLkpQaO42SVzqk=
X-Gm-Gg: AYBFou2XtL2gV5cVU6IjAg1jJE1OzSDBk5Fc2FnCgu6S2yB5MU5N9L59r0w8Gd0Ya2B
	ydczQ4neUu+ZmaB38srB0lUTsOgGCdchyELz76SzTaVLd6uqQBrpWveUaWd2HBztlut2Nmj1Fmi
	Kg5VDt0xjd9QpWj9BsFvxQ5iEpZeoiwxp1OLPozJbi8wJlOF8ITpE60XnBnVYrmyCtPgWoQTdeH
	7L9/QDpJrhWxRHOPvcHeK5mwxTka/nXKp+dz62vWPd4u38GSWINVIoNKsVe/RiUaeKQ5Fw63WWU
	StvWyWRaiHjlasOZSQnZ9ENpUxIRLQvZHk35aOSXSWohqKvXYY64DDk+s/FdOPYcspFRwhAT2Ac
	n1q42G0dvEYMarE8vU1kccboKFt6uCmqTQ+y4knCowX+c2qtGJ4zmtMUIhfhS8v3nP1/MppAKL1
	OjtM4CnfQxkDnhpJEZ/zHPyII7FQU5xgGVovtzbm/N5zZuimz6leteA3e6vHO4nksyx+uOJWab2
	kJgBjnUxc1tRNRr21LSHPEwJ78//528VjKLRLg3RkslaQZK3OuH2WpAoolmYYRlNnCNeiJr+6Pm
	NQzuiKUph6NBsh1IpxttpLP17V6+S33QE+sPS47vmAo=
X-Received: by 2002:a05:600c:3f1a:b0:4a1:c6fd:4db0 with SMTP id 5b1f17b1804b1-4b963c87ffdmr68091205e9.19.1794222379267;
        Mon, 09 Nov 2026 03:06:19 -0800 (PST)
Received: from arrakeen-2.home ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e32ad4d1sm239723095e9.5.2026.11.09.03.06.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 03:06:18 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 YuChia-Kan <raspberrykan@stu.hqu.edu.cn>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20260903-mibox4-dt-v3-0-1a8e395d923c@stu.hqu.edu.cn>
References: <20260903-mibox4-dt-v3-0-1a8e395d923c@stu.hqu.edu.cn>
Subject: Re: [PATCH v3 0/2] Add initial device tree support for the Xiaomi
 Mi Box 4 (MDZ-21-AA), an Amlogic S905L based TV box.
Message-Id: <179422237792.1514386.10691096283154842282.b4-ty@b4>
Date: Mon, 09 Nov 2026 12:06:17 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_030621_535855_64938DF3 
X-CRM114-Status: GOOD (  13.83  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On Thu, 03 Sep 2026 18:18:44 +0800, YuChia-Kan wrote:
> The series adds the board device tree and enables the main on-board hardware, including eMMC, RTL8723DS Wi-Fi, HDMI output, HDMI CEC, USB host, power LED, audio, Mali GPU and the Amlogic video decoder.
> 
> Bluetooth is currently not described in the device tree. The device firmware uses the H4 UART protocol, while the current mainline RTL8723DS Bluetooth support expects H5.
> 
> Tested:
> 
> * SMP (4 CPU cores)
> * 2 GiB RAM
> * eMMC
> * RTL8723DS Wi-Fi
> * HDMI output
> * HDMI CEC
> * USB 2.0 host
> * Power LED
> * Mali GPU
> * Amlogic VDEC
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.5/arm64-dt)

[1/2] dt-bindings: arm: amlogic: add Xiaomi Mi Box 4
      https://git.kernel.org/amlogic/c/3e965cc7f86b7358a850b191605db72a09450f81
[2/2] arm64: dts: amlogic: add Xiaomi Mi Box 4 support
      https://git.kernel.org/amlogic/c/36f28822232ae35d36ccd2587e333db1ac961ff7

These changes has been applied on the intermediate git tree [1].

The v7.5/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
