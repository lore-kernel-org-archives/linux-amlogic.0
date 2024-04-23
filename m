Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DD8BC4345F
	for <linux-amlogic@archiver.kernel.org>; Tue, 23 Apr 2024 20:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HfDh9tq3XglbJlTsJ0kuVrN4l0OsyNwSZE+SJ58FjNQ=; b=xsFQP4T+oWcG7A
	nNCdLae7VxRsVouYXEuWCICMSPlHw0mzIK8KoHyAlPjDTT2wAlcEzCG0/4pqu84853CeTEyPIP62i
	4L3JckDcCA8udj1N/g6qMtEhosVPYZrZdCNmLIGqgSMy+LbDo0aiFtw8Odb6zuk1mVE9pq+qBbgxY
	sAcPLdUCSdE3vvTYoC4oMUr6rpDerXv1DpuVjMVhaAyW3nj2lv7R5D8vKi9AGXi3+RQ4nEN+zXo9F
	GubCYuVCijVz+00xVoOu2VAR1+yrO9rvCmVmO4NIX0dKX8SafZIKsiZ7npetsOtuuNm87OTMlNHQO
	TVNgHGgZ9txN+BzINsSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzMfC-00000001OxT-48cd;
	Tue, 23 Apr 2024 20:22:50 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzMf2-00000001OtS-1DN4;
	Tue, 23 Apr 2024 20:22:41 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-2aa0f3625aeso1021311a91.1;
        Tue, 23 Apr 2024 13:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713903758; x=1714508558; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ERg1J41d06etnj+H8lues6SdgOvc50LdXU0Ny6V07n8=;
        b=APZsGhkugZTJRZyKOrNjh2rd7iDtubYOoRo8/kEn7Mg8lbJJXOp44oyqDJqWu3ssDU
         o7EFYIRDnYWmiVGaKmVFYYzhVUr7FP3BJll/SbfyB4IFQr/N53pX2bNLSPq5sT9wX/i5
         x8Yo7hK0kUBYg9xd9VTJfBNfpjXoiNVQDJhdn2ovuCYM0Xxm3UR5SJ7sTL5a9P9FNo/y
         H64KyWrGxOrZIdcQ+/w3AmZwWacjYetOu/LS51v2NgT/xWfKBO6nr7u/loTHvz8ThMOd
         nkCx6gHPjn6BshnU8grj64zpJs7TvaxcnZJovHpjdOPzxIEUnh5LlOFAQ9yLirqjgCoa
         lEeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713903758; x=1714508558;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ERg1J41d06etnj+H8lues6SdgOvc50LdXU0Ny6V07n8=;
        b=YgPzQbBdxglaNxocXWjBJBEyqec3LBQwxYHntJmQB4OARhbZJkJaNbXVdHyMbQaU7/
         S3t8cqhhQpbho2G1thpgXX7NRRIfe0HlLu7fUQFw2JdY5QhSDVRRQhrVnme5LAonjlKr
         TVfEfOvABVyW0Jit0JcyRAaXLbId3XSLASWMyjojJYsH92CyVCF8baObCd7AoZ/QWyqa
         UVxz07wmLz5Dp8Po4mT0tVDt7vqO3lhhxRcvy/+Raa2r1yQ1kL62tC0/N8jcCGmzV+/1
         HsYXCCji0QKc5j0gsBmuDPtY+cK6qhKcPhlnbQ3GyFvcPNhetpEokr86p85lqf6Zozj2
         aWOA==
X-Forwarded-Encrypted: i=1; AJvYcCUrqtZdfBDYxwCpsHG68xoFJSPv64wpIMKySzqPRivY9LLoJlU+om9WCIhPccjL8uuIbEpOKhekkxwO/Qru5sqe9lc0fJaS+qpgOJLl2Mih2gwa9Iy/32StCSEWM0l0M0/LkMHvv0SdE0ffvV0mViPtG4doMMo8hA==
X-Gm-Message-State: AOJu0YzzcH/AHDpr+TK3L23wFwpotCcwKkrYEizsdYdloV/Bl64jTXh3
	pKgZzfA4EOpv7iabWY6f2RQOJrm+M8zv4nGoyI91/cb9285035R7jVEU4tyf24XF1hLrmQBtyOr
	kG5Hl7oeinRyEjCxS0cgFR40dcvk=
X-Google-Smtp-Source: AGHT+IGueta3RswI0M/FkR9FwKeiGdRf4qn24eyoS2YMfXNjlyVhaYbnUKY9bbwjHMq/YHliJwPYRdqyRkDdJn/L/O0=
X-Received: by 2002:a17:90a:408e:b0:2a5:3f1f:a1d1 with SMTP id
 l14-20020a17090a408e00b002a53f1fa1d1mr521558pjg.0.1713903758085; Tue, 23 Apr
 2024 13:22:38 -0700 (PDT)
MIME-Version: 1.0
References: <20240423172208.2723892-1-andriy.shevchenko@linux.intel.com>
 <20240423172208.2723892-4-andriy.shevchenko@linux.intel.com>
 <ZigSiCBIwoEIPYoG@lizhi-Precision-Tower-5810> <ZigUL7exXBSbWDIR@smile.fi.intel.com>
 <ZigXJJj4e+oaANAt@lizhi-Precision-Tower-5810>
In-Reply-To: <ZigXJJj4e+oaANAt@lizhi-Precision-Tower-5810>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 23 Apr 2024 17:22:25 -0300
Message-ID: <CAOMZO5CTiXWMXgi35c4M4XsdZ26-QiArXcBcViYnwTAgd00nDQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] PCI: imx6: Convert to agnostic GPIO API
To: Frank Li <Frank.li@nxp.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	linux-omap@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-amlogic@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org, 
	Vignesh Raghavendra <vigneshr@ti.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Richard Zhu <hongxing.zhu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Yue Wang <yue.wang@amlogic.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Xiaowei Song <songxiaowei@hisilicon.com>, Binghui Wang <wangbinghui@hisilicon.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240423_132240_351904_C1E74CB7 
X-CRM114-Status: UNSURE (   7.42  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBBcHIgMjMsIDIwMjQgYXQgNToxNuKAr1BNIEZyYW5rIExpIDxGcmFuay5saUBueHAu
Y29tPiB3cm90ZToKCj4gaWYgKElTX0VSUihpbXg2X3BjaWUtPnJlc2V0X2dwaW9kKSkgc2hvdWxk
IGJlIHRydWUuIHRoZW4gZGV2X2Vycl9wcm9iZSgpCj4gd2lsbCBydW4gYW5kIHByaW50ICJ1bmFi
bGUgdG8gZ2V0IHJlc2V0IGdwaW9cbiIgd2l0aCBlcnJvciBjb2RlCj4gLUVQUk9CRV9ERUZFUi4K
CmRldl9lcnJfcHJvYmUoKSB3aWxsIG5vdCBwcmludCBhbiBlcnJvciBtZXNzYWdlIHdoZW4gdGhl
IGVycm9yIGNvZGUgaXMKLUVQUk9CRV9ERUZFUi4KClRoYXQncyBleGFjdGx5IHRoZSBwb2ludCBv
ZiB1c2luZyBkZXZfZXJyX3Byb2JlKCkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2lj
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1hbWxvZ2ljCg==
