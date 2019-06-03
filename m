Return-Path: <SRS0=ej2R=UC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8609C04AB6
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Jun 2019 05:51:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B705227B6E
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Jun 2019 05:51:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iLmiDM/x";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FhD56eyg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B705227B6E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=8o0T09warvS4v9btiNRpPUtoM9x1zjBtnuhwf3TxOy8=; b=iLm
	iDM/xY98RHJ0hFhpszL1DU7Jc+k2WHisHy/V2XNH+OOBNMJ92jZ88fsw7JIMDUMDKQr0daEtLHQNi
	LMEbAfcqUOmcjNrctHMBqsEU8uIerUEjh5jHKtWe3tu/tAmRgfm+qrVTS1xzzuLUdSjptT2apshzb
	2yAxiu0TjfpVtVN08zSAmUDD1cVt524LMHXy4qlwQWHapzphB8Pt1mFfAE4UayabYuS8VFYidScDT
	S+q+kSDHaLRfkFVCUUCSV75Zmk+TRMnty/mqKK9EtsH4QHCjjJ6RxK0HakrloFyAL3j2ZAoDLp7Ne
	HrwEdsxM8ggMmbjib+ZvXSXxJUQACmA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hXfsX-0003cl-VK; Mon, 03 Jun 2019 05:51:29 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hXfsV-0003c2-Bm
 for linux-amlogic@lists.infradead.org; Mon, 03 Jun 2019 05:51:28 +0000
Received: by mail-lf1-x12f.google.com with SMTP id q26so12561488lfc.3
 for <linux-amlogic@lists.infradead.org>; Sun, 02 Jun 2019 22:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=pLob6MnZv7Who0mkwt1w7rJgFIamXYDAJ9vpqfigZX4=;
 b=FhD56eygeuBrvCbtKfOwUYh5b/INXlwlUsLaeSHvLMMCqegjyH2QCgyfZ9BKjL1E97
 cunewAaYgx9GfN/s6IxmfXLT+GewGuoEK6Rue7cNY/kqGIXFWYHeZlh/hh2L1n4d6goB
 WRjwxBF+o7FAPPs0GeeNDCEthTFW0g+FM0i4tJ+E7aGYeSDQEuv2tzpJxX9DRLHE7J8o
 AAmf/SBMg+hoQfsSbaJl2Ar5ifdOsAdMxYLTS+6z3SIo6vAWatpphzbXVzLpRvCcrl2u
 EqbPewu0xg5Ep9TNOgO+8rpKOp/sgnp773PG3x5eTbNG4vz/XGcvy0TDenLyzqlo+Rxg
 Nk3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=pLob6MnZv7Who0mkwt1w7rJgFIamXYDAJ9vpqfigZX4=;
 b=WXLGpstXH70CCLiERsRbWxKb9UY4ykoUDrunSz68w6DCgasw6ysozzaKDJn4JRa2eT
 UAbg8c5Hk+lww6Ty7yPAur2PFuiWTQI/aDDIit/Y/0HJ78EZ2Vn0GSAk8hbcl8Jjs0hK
 ThJthXtrGgWpxS6MgZohc17UQ3UdyocqaSaNnCc6Hd8YPBbFdcYieisDX4VYVJMwxA6x
 i0Co1LYfEGl8TqezbPZxfeTr5xubY8nIbMT1+8O3IUSOZ4gHSaaCzwDBr0i6H84DcWaA
 Fvl54lgOb+zXzAhl2HpEXYKVMu0FOedNrebrpF4X5WcWweRTPUckbtHufLXVpIk35W+X
 aeqA==
X-Gm-Message-State: APjAAAUb55eRrmkjo2aMCQ8ZkNm1JqdR0AkjbkvsJELDlWo/3Fj86Ncm
 YpdDF0tmvdd7xRdWDTBXYZ6/fiD/eWWoPsZujLlRZZ4bsj8=
X-Google-Smtp-Source: APXvYqydiRlWjVpg09SNidytHfG29r/QElAdxCwfOPMS1TPD7N6AhxvbwNYM7PzHzVvu0LTcZ6nOr5ZC8LTMAs58BAA=
X-Received: by 2002:ac2:46d5:: with SMTP id p21mr10465011lfo.133.1559541083118; 
 Sun, 02 Jun 2019 22:51:23 -0700 (PDT)
MIME-Version: 1.0
From: Gaurav Pathak <gauravpathak129@gmail.com>
Date: Mon, 3 Jun 2019 11:20:46 +0530
Message-ID: <CAMvYpdmHrbEECic9=-Vm_XGu2bofxhw=xpZBe0mDGeOhdXcXnw@mail.gmail.com>
Subject: GPIO IRQ for Meson gxbb
To: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190602_225127_428919_AE75495D 
X-CRM114-Status: UNSURE (   5.79  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
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

Hello,

I am currently trying to use GPIO IRQ on Odroid-C2 board.
I have compiled a working image having Linux Kernel 5.0.6. It has
Pin-control driver and Interrupt Controller driver enabled.
However, I am not getting any idea as to how should I request IRQ for
a particular GPIO pin say for e.g. GPIOX.10. The "gpio_to_irq()" call
is not working and it is returning "-6".
I just want to write a simple out of tree character driver.
I tried to get an idea from "drivers/gpio/", but they all seems to be
platform driver.
I would be really helpful if anyone can point me to a working gpio IRQ
example for Linux 5.0.6 kernel.



Thanks,
Gaurav Pathak

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
