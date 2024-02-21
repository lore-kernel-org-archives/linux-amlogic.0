Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96D0FC5478C
	for <linux-amlogic@archiver.kernel.org>; Thu, 22 Feb 2024 09:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=z8zUnvg+07jzaN6906thrA2rRfTS9W5Yokn18HqFXio=; b=FPqsKZv/iAm2Fp
	FoH1gQ7niqwnhMKKra12PxFPAW15ao4qmXU09A5qw97ZATfNXRjOCU9xC6+ucX2XzYJutF9DoVIhn
	+/G9Y6X2FK7qlyC5RhjdElzAKBMdBA7B+LnFLwl0lEfbjZTrN7pwDHRSBVjzt43Jz4pc6Zo6S0Q6O
	94UvDFUFcA4eqwCYLLIeZ1TptlWQG+eVJ4QQYLD9lzN1yhTYAJIxpmdWDQYBIGp7BSt+nfwJ/c0wv
	b3qBIpmshg9lPKovGV3FKlWALbf27AL9Tdsn8HVqCFgTAvWpVcZvN9KxwukHw+quSKHuFABqnN9GR
	Ek6owGvsTUVZcSzmNLfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd5qu-00000004OCe-07Gt;
	Thu, 22 Feb 2024 09:58:52 +0000
Received: from mail.thrivehub.pl ([164.132.48.43])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd5qr-00000004OAc-00zx
	for linux-amlogic@lists.infradead.org;
	Thu, 22 Feb 2024 09:58:51 +0000
Received: by mail.thrivehub.pl (Postfix, from userid 1002)
	id 07D4D25457; Wed, 21 Feb 2024 08:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=thrivehub.pl; s=mail;
	t=1708504955; bh=m3ZUCTPRVLoDFM+cXi7VhHW+xNF3eUdGHrj1eDbLwQI=;
	h=Date:From:To:Subject:From;
	b=BOcEgVw8LX/Ijudv2s+uKEyoaMfYf6yxAt2g/iyvOvnmsgJjFDGTvQt5wCXXizgWQ
	 TxuPjMuo6nMg0vqwxHkDGh4T5NLrokXLiLwlPK3r18KuWCpAeOV1DYhg4OAXNcG968
	 fGhSR36IF288IWBH/IgBbNVJTTJ1K0BeGNZ7pZys52hOIJYQYdn2ZytW0fRQ84QcUo
	 pCQZmIyeCXoB9V6LGb/yPYV+Bg8RoucbwvQ0OLF/ZIsnsjPnWspCJxo6ThDeu4i52t
	 L8wjwwVQvnqg1ON+N8gPC2r+7FSdtl50CwaL1YEpNTCVX7UyDcjuh+Gk4g1ee4xPAg
	 PCeXr+XkwLFfQ==
Received: by mail.thrivehub.pl for <linux-amlogic@lists.infradead.org>; Wed, 21 Feb 2024 08:41:10 GMT
Message-ID: <20240221074500-0.1.4r.23347.0.ddmb3q9nvz@thrivehub.pl>
Date: Wed, 21 Feb 2024 08:41:10 GMT
From: "Szymon Jankowski" <szymon.jankowski@thrivehub.pl>
To: <linux-amlogic@lists.infradead.org>
Subject: Zapytanie ofertowe 
X-Mailer: mail.thrivehub.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_015849_788943_A39080D1 
X-CRM114-Status: UNSURE (   1.41  )
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

RHppZcWEIGRvYnJ5LAoKUG96d29sacWCZW0gc29iaWUgbmEga29udGFrdCwgcG9uaWV3YcW8IGpl
c3RlbSB6YWludGVyZXNvd2FueSB3ZXJ5ZmlrYWNqxIUgbW/FvGxpd2/Fm2NpIG5hd2nEhXphbmlh
IHdzcMOzxYJwcmFjeS4KCldzcGllcmFteSBmaXJteSB3IHBvenlza2l3YW5pdSBub3d5Y2gga2xp
ZW50w7N3IGJpem5lc293eWNoLgoKQ3p5IG1vxbxlbXkgcG9yb3ptYXdpYcSHIHcgY2VsdSBwcnpl
ZHN0YXdpZW5pYSBzemN6ZWfDs8WCb3d5Y2ggaW5mb3JtYWNqaT8gCgoKUG96ZHJhd2lhbQpTenlt
b24gSmFua293c2tpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1hbWxvZ2ljCg==
