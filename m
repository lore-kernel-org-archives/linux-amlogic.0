Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CE9CC4829E
	for <linux-amlogic@archiver.kernel.org>; Thu, 15 Feb 2024 08:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=36gRQaY3Qfta6Bv2C9Pzv3z1xvH4C6jCaX/b1QXlriM=; b=P/zJL7cKzhUyHZ
	bc2XPWnEoLFGGfbS3YeVPby7KJwWRsNkzT54rd459s8WpKx7Enc+eKjtlnOaowxxqvnNIrT5ebHhF
	0C+wtikT3tq/QnqW9fE6v6kOmAOeOTZyF4VN/j25gEMO5RHHqKGv/9uCemUDzuLdFxcmHXKcSzTzw
	IGpcEzVX2OMIQSlWLWa5NjbF2Oxa8+oKZjS4Grc9DGQrrBqYFwPLxyK+HhgUlckdoKMie7or+cer5
	Fqebne8hVc5ZKKP9QaDWW/fi/QWnktKl8LiId7yGA3dr5bRkrETMTJkLVl7t9n6QP1kFpb39Ohy8F
	WfBFRZVGtMAXnIXBzBAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raXEQ-0000000FMxH-2GIf;
	Thu, 15 Feb 2024 08:36:34 +0000
Received: from [162.19.155.126] (helo=mail.commercesolutions.pl)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raXEN-0000000FMvc-1Gmq
	for linux-amlogic@lists.infradead.org;
	Thu, 15 Feb 2024 08:36:32 +0000
Received: by mail.commercesolutions.pl (Postfix, from userid 1002)
	id 11E0724D14; Thu, 15 Feb 2024 08:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=commercesolutions.pl;
	s=mail; t=1707986189;
	bh=PcMncQpBfIZCnTOfZJY5G1G+gaLn4c9QPfFvoXrE4rA=;
	h=Date:From:To:Subject:From;
	b=eu0yHwiIk7REvqK6YV5RspXaFopruFw9X+eoZrXMB1C9hZVJaHZGtLBqM2F4TCb5g
	 7OIFdxy/oa2Mzy4pamxNqObpgx9coMwXl14EjWRZ+KzLcOn3txFjf+C/Sj9PEInkDm
	 I4RSOk3/F17pw+BoydmovEChlxmQSgv1Y0iAVuh31D6sR4HhcccPWmSNbgke+X2y39
	 0AGrn2aw62fim65jCuMBH4w3BEr1yv+Q9zjGP899HoImAFmr8GD3HLYLlrY3uZ9jPm
	 eSIQ8fRkwrP37jQWnRG2uDMvRKcoBCEA8qn5TL8TKyJxj1cOvo148CE6cmYh4O7v23
	 Jueu9WlDwIMOg==
Received: by mail.commercesolutions.pl for <linux-amlogic@lists.infradead.org>; Thu, 15 Feb 2024 08:35:30 GMT
Message-ID: <20240215074500-0.1.bo.2kts7.0.1nfcdsredx@commercesolutions.pl>
Date: Thu, 15 Feb 2024 08:35:30 GMT
From: "Kamil Tralewski" <kamil.tralewski@commercesolutions.pl>
To: <linux-amlogic@lists.infradead.org>
Subject: =?UTF-8?Q?S=C5=82owa_kluczowe_do_wypozycjonowania?=
X-Mailer: mail.commercesolutions.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240215_003631_498219_D1D39470 
X-CRM114-Status: UNSURE (   0.88  )
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

RHppZcWEIGRvYnJ5LAoKemFwb3puYcWCZW0gc2nEmSB6IFBhxYRzdHdhIG9mZXJ0xIUgaSB6IHBy
enlqZW1ub8WbY2nEhSBwcnp5em5hasSZLCDFvGUgcHJ6eWNpxIVnYSB1d2FnxJkgaSB6YWNoxJlj
YSBkbyBkYWxzenljaCByb3ptw7N3LiAKClBvbXnFm2xhxYJlbSwgxbxlIG1vxbxlIG3Ds2fFgmJ5
bSBtaWXEhyBzd8OzaiB3a8WCYWQgdyBQYcWEc3R3YSByb3p3w7NqIGkgcG9tw7NjIGRvdHJ6ZcSH
IHogdMSFIG9mZXJ0xIUgZG8gd2nEmWtzemVnbyBncm9uYSBvZGJpb3Jjw7N3LiBQb3p5Y2pvbnVq
xJkgc3Ryb255IHd3dywgZHppxJlraSBjemVtdSBnZW5lcnVqxIUgxZt3aWV0bnkgcnVjaCB3IHNp
ZWNpLgoKTW/FvGVteSBwb3Jvem1hd2lhxIcgdyBuYWpibGnFvHN6eW0gY3phc2llPwoKUG96ZHJh
d2lhbQpLYW1pbCBUcmFsZXdza2kKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LWFtbG9naWMK
