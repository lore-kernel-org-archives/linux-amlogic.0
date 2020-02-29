Return-Path: <SRS0=pdBZ=4R=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BCC0C3F2C6
	for <linux-amlogic@archiver.kernel.org>; Sat, 29 Feb 2020 17:31:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 38B0524672
	for <linux-amlogic@archiver.kernel.org>; Sat, 29 Feb 2020 17:31:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hyCzsX/Y";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="QVtbZxL4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 38B0524672
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lDFZMDixEP8mjEp9yzeSOq4LnpXCAGYVPs9fJSYerqQ=; b=hyCzsX/YGmazB8
	bT4hoYw7+CQIPng5/7z7vXIBf4WHZ79qyC1gZMO0ghBkhjd0VQNwL791JdzRKRG2aPbdlmZibmqQ6
	w5QI02sTNl8kzOvqMAGT2Mf/vsrmzWc5D8AzoqMCfsj1WO3kOEEyj6oXd/6sWJJAa3AD2EGxnSiFU
	3bJZ9gSDGaFvTRD/Kh85Nj1USdpfPr2p3vZsueIzj/u6OZAI7FEe1+e/QRuALlYfT48YCU9vnBcxP
	aZUOKVP70fxGcauh/jenq9Meusx5xHV/vVlOzkkze8zQrKLVLdn45Uh/hRn65CLMXYYtCkYFvU94p
	QIykOZ9FIL5WtH+GmMFQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j85xj-0001Gs-0v; Sat, 29 Feb 2020 17:31:39 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j85xa-00019U-TJ
 for linux-amlogic@lists.infradead.org; Sat, 29 Feb 2020 17:31:32 +0000
Received: by mail-wr1-x444.google.com with SMTP id v2so7171564wrp.12
 for <linux-amlogic@lists.infradead.org>; Sat, 29 Feb 2020 09:31:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=gIWhpXkGhBdD7D4tCRq8IhuPOVGlHh8cgQBYQ6BUTQw=;
 b=QVtbZxL4BTuOxWG9U7zurT8eoEW0kIhCosDTS6Y/48DrOg8qUH0kOS2rvyykW/zWZ2
 QAetKLAw6hJCoqsbII4eHjnCCELiBOm8pnZHs5QmpKLTYHmaznrsrb0tpJfDJQ7Hs/Nj
 0ZPNxzQbF4rk1Sj9k/DmNS31m/LZqXrk0EIj7fYomlSssHR8jjFRqQSPryvnxMlj/oQu
 e/RBcwAWRFuX9r2qRrOUtVvjXY4ZpPBEBmUnslSZCpUfeM0YGsJxaR5J44dkxv3FpuIi
 U72YHyQ2VfOMmJCXEJ0BK1vXYd0KJ/e2RDZtfmu3gEjfZDfZogCJegkZgt9q1ce4AJLj
 JAVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=gIWhpXkGhBdD7D4tCRq8IhuPOVGlHh8cgQBYQ6BUTQw=;
 b=bTjYrA2uaOaAwCY0DKmlf2mV/Gz3auDXK5B4sVKOOP49eEQ4v3DwajV02/WRJogRcQ
 3obM1YpjWhuAtYbWIxqowdUayrh03Kzo9yay8XT450Nb4EKDZQAVFd75426SfzjW50q6
 wnighyn08+sjGF13DAOJIQsJQGzUjbT7NWADJFX8HE5QD4FRBpkeoGIo0G9EndGi/8Pe
 lf12bdc8v2vHnI/ycuGoSqUxqKvX0PUHQz9WgAp38lxHBGCyA8Sfo99WZoYuU6kcaz+J
 AKmeAZiozMVODFWWzyzXWZ3RFZ5PrYSLptRXaP9SxCuBrhYOj9YixlMCinry+5OWcyNf
 DaNw==
X-Gm-Message-State: APjAAAVb0uru49c85vA+ok6/mJAcTg8LWWRDtAzqjifdylfgOrnnWERW
 p9xN/2z5gaheM2CDXSTUqYIg7Q==
X-Google-Smtp-Source: APXvYqxT81ciYzv3VRN7D5AK2cO0SiOZFOz6Hky5+PclfU1bKhrwyZ6y65WbJRRZN9RDot83f+FhcA==
X-Received: by 2002:adf:eb51:: with SMTP id u17mr12129653wrn.29.1582997488817; 
 Sat, 29 Feb 2020 09:31:28 -0800 (PST)
Received: from localhost (229.3.136.88.rev.sfr.net. [88.136.3.229])
 by smtp.gmail.com with ESMTPSA id 19sm8213197wma.3.2020.02.29.09.31.27
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 29 Feb 2020 09:31:28 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, balbi@kernel.org
Subject: Re: [PATCH v4 3/3] arm64: dts: g12-common: add
 parkmode_disable_ss_quirk on DWC3 controller
In-Reply-To: <20200221091532.8142-4-narmstrong@baylibre.com>
References: <20200221091532.8142-1-narmstrong@baylibre.com>
 <20200221091532.8142-4-narmstrong@baylibre.com>
Date: Sat, 29 Feb 2020 18:31:27 +0100
Message-ID: <7hwo859u6o.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200229_093130_998744_E969E566 
X-CRM114-Status: UNSURE (   6.79  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Jianxin Pan <jianxin.pan@amlogic.com>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Tim <elatllat@gmail.com>,
 Dongjin Kim <tobetter@gmail.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> When high load on the DWC3 SuperSpeed port, the controller crashes with:
> [  221.141621] xhci-hcd xhci-hcd.0.auto: xHCI host not responding to stop endpoint command.
> [  221.157631] xhci-hcd xhci-hcd.0.auto: Host halt failed, -110
> [  221.157635] xhci-hcd xhci-hcd.0.auto: xHCI host controller not responding, assume dead
> [  221.159901] xhci-hcd xhci-hcd.0.auto: xHCI host not responding to stop endpoint command.
> [  221.159961] hub 2-1.1:1.0: hub_ext_port_status failed (err = -22)
> [  221.160076] xhci-hcd xhci-hcd.0.auto: HC died; cleaning up
> [  221.165946] usb 2-1.1-port1: cannot reset (err = -22)
>
> Setting the parkmode_disable_ss_quirk quirk fixes the issue.
>
> CC: Dongjin Kim <tobetter@gmail.com>
> Cc: Jianxin Pan <jianxin.pan@amlogic.com>
> Reported-by: Tim <elatllat@gmail.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

With the bindings reviewed/acked, I'll queue this DT patch for v5.7.
The binding and driver patches will need to go via the USB tree.

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
