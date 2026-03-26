Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DD3F106F30D
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Mar 2026 09:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IwCCYlbiyGibg0Usms+PhidFDKYwZQ39p2TWzpfqYhg=; b=OI6WTWr1rvitG4
	59me8xqhxtAeFFdrUoWnfSa2inBNDj9SuLf07nA9V0fpdcw2dmhW7HrejJ4SuJ4kaoVCEprrf9aIt
	axS7SC1Flrx1iUqRQtpcR9cmomN9clEzgd+YoUCwoUDoxvrn1FlDyBBotz93V/iQfRMUeSltg+I60
	gYK3r4N9OKVwfZBFAdTcHfYwFFhahG64uBHbYuYo/A+eJ44rjrEFuG9UemLd1yNPtvtnMJ1eNMax4
	aGCXbx62eSFAdpF37E4YbO/NheF/1Khsxr7/hK301HyEAeTb2QCvCzlK6Nm62rQlbn/ta8/JNC6o/
	iriuMol52CehS9tS0KgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gfq-000000056GL-1lQk;
	Thu, 26 Mar 2026 09:06:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gfp-000000056Ey-0Uxs
	for linux-amlogic@bombadil.infradead.org;
	Thu, 26 Mar 2026 09:06:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=iEUmFqIVUAlOVLueUmIQnwuJJZTXsJrLZwyhfc/Xwho=; b=eEci6kX2zjN/0dK6iw20ErjsSF
	RhBM/LURZGr52f/5RyRFPGJACs5q24T/tZTQZ882Kqj4Tkunyvlsii95agdrw+FfdlA3gD6+S8L/w
	Y6vT2CzUjydKs01/uXMOTVXnF8XLZwz5bmPHm3MOo5EeyDvGDH3EnFcbFeM29Bn2rjU3NZG1yZ2tc
	NbIhIyRkwjFSt+w1pxN94s6ohieA6/Wxdn34pZmJ5wSc7EtGSArlTo9xdzQ6gsWumLrpjZ1xCpXb0
	OY7IeMyb3xatp/Es3tFCjx03U95eFKFB7tZNimFK6tRBPRMLJOo3Ufus/mnvfwZ5H2gp4ET2xRrmu
	JwphkE3g==;
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gfl-00000007pvH-20pG
	for linux-amlogic@lists.infradead.org;
	Thu, 26 Mar 2026 09:06:39 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-486fb112c09so7053365e9.1
        for <linux-amlogic@lists.infradead.org>; Thu, 26 Mar 2026 02:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774515996; x=1775120796; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iEUmFqIVUAlOVLueUmIQnwuJJZTXsJrLZwyhfc/Xwho=;
        b=Zh5BdGoJee5emS0nT3gH4zNTE2egALy4xc1bxkwFBmzxz1IVkgCEzOVmrX7RN0QxVN
         /GmDymTjR6RLKtaWBPh6euvdD6nFyCLJt4aC4bN9n3c7wL7bbL8df0swb2TAzz6G8OEi
         9W8lTAMF7aihVasX+jP50Dt/E92X/U/xMKvrz3nGN09xrs0gSdjZxNQR0Y77yijE/aUd
         qWi5BBFgca1c+AOb3uAuxhhi4UeVX3dTm/bX0F6jBwQ0f2bpcOTHzwKad0722493z7S2
         ZBD2gTKsguFI62+CHilIu7SB8FKdn7FakypHDwC7icPAECP4sV6F8Gqawl+zdi/+ZrOB
         vHDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774515996; x=1775120796;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iEUmFqIVUAlOVLueUmIQnwuJJZTXsJrLZwyhfc/Xwho=;
        b=N5x44kt60w04aYEw0vfiCOSuttHSVE8qQt3S8kBxTNqjmrYmjJUHAd+dExHbXjwNA7
         SD/gi/79fxdkSjSqN3zfys/4mWpiZ2Et7QaGZ7V3weZfD0cnrd5ytI7y55RWH52HR/Wx
         uv7dfAjR5Zv3RXgyWwZx70NVwTCEaZ3br3cRCeLHZ3bKzkeXGw4YNyBZRcWZr0a62A23
         sLQcLmYEZtes3nPIIucOaiEtV30L2ZFgpef+Egl+mRkFtQRUuR4ATGIvMc+kF8b9I8yl
         UnR72oxl3AOFKgK/xpXFZSf+jcRq8vEg12YSRPt3icJiPA/kZPV2pO2lxXxLO+aCcok3
         rUFA==
X-Forwarded-Encrypted: i=1; AJvYcCU7X1zUP+9MsG70S5rHBQKzEk+RD5EqUKyubGlJMgu/P39ktcShdfkth4AhMs/KJ1ZT6Io7xELX0EOKtODG@lists.infradead.org
X-Gm-Message-State: AOJu0YxZlgtnJTGe94OYRPSyvDHqDwZE9oTgGUpwVmAAIiNICjdUwG4d
	iXIpUTWkl1lbaBU3QE+ukU1SKitsSzaYmkxXIalsELzx3zezBSA5VIDAHGJfL11mP1I=
X-Gm-Gg: ATEYQzy6pbrFN4Q0I4S3TqYDJyqH01O0Q4qkh/47JnfB1TB5w56tMIQRLl329O3zT9U
	2qLj1aFGZb/CwnGH6n1fIzv811BJ8vA45WtCXKW5v5qFQXnwXdznDHhQy0RNVapUKnyw8qLHAWx
	u/6uRMpTJNQjfaCRRpoLcJMSl4qUgxFOgsnFe0orw9btkQrcDO52cLVYSEdf631J6tgFl18/zkC
	ICwM2v8Nw0kzyX1PKJ3OCrAH2+nCkTEnK6kiQzXF36bYeRP+fKXq1L8+ditRjp23btiqEs74IXY
	2u47++W29cLOmhj+K6DzUDe98fTgYjGgXO7vcTmjP/umOBAPo9lOZZ5xCjreimdJ6MsLC6tDl6O
	jxsO19vu48QSSRI3T2Ug0aKW6dNefro99924UjAv9fBi0qtQSQEM06Bv2BJPfm4Rnm2ba4qvVHH
	CuRnQ1cztcSKStod/heqUnnMjLhbP+17rUz4l7Y0tmSVM1
X-Received: by 2002:a05:600c:64c6:b0:485:34a2:919e with SMTP id 5b1f17b1804b1-487160a681bmr93976505e9.33.1774515995951;
        Thu, 26 Mar 2026 02:06:35 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4872090368dsm14726905e9.5.2026.03.26.02.06.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 02:06:35 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, Jun Yan <jerrysteve1101@gmail.com>
Cc: martin.blumenstingl@googlemail.com, jbrunet@baylibre.com, 
 khilman@baylibre.com, conor+dt@kernel.org, krzk+dt@kernel.org, 
 robh@kernel.org, yangxuan8282@gmail.com
In-Reply-To: <20260213073810.552341-1-jerrysteve1101@gmail.com>
References: <20260213073810.552341-1-jerrysteve1101@gmail.com>
Subject: Re: [PATCH] arm64: dts: amlogic: meson-gxl-s905d-phicomm-n1: add
 bluetooth node
Message-Id: <177451599509.122020.4339182739490184296.b4-ty@linaro.org>
Date: Thu, 26 Mar 2026 10:06:35 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_090637_704749_CC27052C 
X-CRM114-Status: GOOD (  10.22  )
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

On Fri, 13 Feb 2026 15:38:10 +0800, Jun Yan wrote:
> The Phicomm N1 uses a CY43455 (BCM43438) module with its Bluetooth
> interface connected to uart_A.
> 
> Add the required device tree node to enable proper functionality.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.1/arm64-dt)

[1/1] arm64: dts: amlogic: meson-gxl-s905d-phicomm-n1: add bluetooth node
      https://git.kernel.org/amlogic/c/d6df314c0165cb809d6c647a593664a4f5028230

These changes has been applied on the intermediate git tree [1].

The v7.1/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
