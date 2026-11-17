Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2DC606A32C
	for <linux-amlogic@archiver.kernel.org>; Tue, 17 Nov 2026 18:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZNDivaU7;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=iav.lv header.i=@iav.lv header.a=rsa-sha256 header.s=zoho header.b=ZllJTcWm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:References:
	In-Reply-To:Message-ID:Subject:Cc:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=xksNZOSt/i+NpxWTAeOHPx4uBGwS6vROnCOGyl7b7N4=; b=ZNDivaU7wG5oXiOCGEKfsOXola
	NVcOZ86Bndt/DsGaJHFljxXTmNVUJ1TbpV5O0+7qpPQcRAZUhVuQgro0uWsSCe2Ni7ceW0+lWhr3g
	hr4TY98s51oHO7xbacRN7SAGq6jmXoqLWZ6SNY6uNPCYlj0f/v7dTAh6LzWV0Kv1MOuO/BjMSsSsH
	pEtagrvZ63/U98PJWE+L4RFvMO+Sid4wbYsH9Ey+RReUDoetig1lcTGAxLyagAVWY9a7D4nWR3/w7
	gV4y1ltTeb2tHxux5EZppTbea/BnmhdEerdgxC9FKM+7EWWSZK0Vp8RpGwyPJU8+mMbYCNwWWIpgJ
	Pe01k0Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTNjE-00000006juz-29Lm;
	Tue, 17 Nov 2026 18:16:24 +0000
Received: from sender-op-o15.zoho.eu ([136.143.169.15])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTNjC-00000006ju8-0lZP
	for linux-amlogic@lists.infradead.org;
	Tue, 17 Nov 2026 18:16:23 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1794939373; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=jPM86I5fXXkHprkvLBi4twb7QXQFfGNSR471U4Xj2AmO33WwucwF4X/RByhfEVf/qStA55x0RUW+OLfQHVLvSLHp/cGG38CJxWp8GDdwPWTa7xrK9EGlg3N448KFGzVcMM+HvIBOmy/sKLpOfhpdHTF9ZCHSaeAu0wzy46Onpiw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1794939373; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=WHIQxeoR6vINETekLiTI/f5ywXyoHU09pB3XVrXEfXE=; 
	b=c0PUZxL6+rrPi5a894TpamTZZdLM9HmSRhUkHs/m/153b9lQT/XXZgwWeQpmCs8boR1MSN8RlUSNw8wnhkFGinH9MmtxzDxayDDSwqtJ49pO1e/IcAgdKfdUgESEuIXj1xtJhi9kXMsirBr6K75g+PXjTbD04KycgRz3UmS++1I=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=iav.lv;
	spf=pass  smtp.mailfrom=iav@iav.lv;
	dmarc=pass header.from=<iav@iav.lv>
DKIM-Signature: a=rsa-sha256; b=ZllJTcWmygp+HGw1t9C5Z3dZMdLLoAUl+GmOz6SupgIpuMNnG+fiqVVkUkHp+W0yv7C46SBl/YZy3rcIcplXT07wDPPAcVL0FyCMESvt4CFt+q6QxfKHwswFWUjvmoIDVb7ALKrCqk/lRkdOB8BlvPX4iSwusI1uh4IKABJcexA=; c=relaxed/relaxed; s=zoho; d=iav.lv; v=1; bh=WHIQxeoR6vINETekLiTI/f5ywXyoHU09pB3XVrXEfXE=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zoho.eu with SMTPS id 1794939371281278.3710763207241;
	Tue, 17 Nov 2026 19:16:11 +0100 (CET)
From: Igor Velkov <iav@iav.lv>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>,
 Shawn Guo <shengchao.guo@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 linux-gpio@vger.kernel.org,
 linux-amlogic@lists.infradead.org,
 regressions@lists.linux.dev
Subject: Re: [REGRESSION] gpio: shared-proxy: open-drain regulators on ODROID-HC4 fail with -EPERM
Message-ID: <20261117-hc4-gpio-shared-od-2@iav.lv>
In-Reply-To: <kcopbszdsz2amzas3hmchxokw4bjxafu2wzjplthyihkellwd2@hd2k3tomwvdq>
References: <20261115-hc4-gpio-shared-od-1@iav.lv>
 <kcopbszdsz2amzas3hmchxokw4bjxafu2wzjplthyihkellwd2@hd2k3tomwvdq>
Date: Tue, 17 Nov 2026 20:15:00 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_101622_500123_BEE5A39B 
X-CRM114-Status: UNSURE (   6.23  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 17, 2026 at 02:35:03PM +0100, Bartosz Golaszewski wrote:
> I think the issue is with the proxy driver not
> propagating the -ENOTSUPP error code in set_config().
[...]
> Could you try the following diff?

Thanks, that fixes it. With the diff on v7.4-rc3, 4 of 4 cold boots:
no -EPERM, vcc_5v and both p12v regulators probe as open-drain
outputs, and both SATA disks come up. Stock rc3 on the same board
failed both p12v regulators on the boot before.

Tested-by: Igor Velkov <iav@iav.lv>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
