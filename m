Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9201C4828D
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Feb 2024 09:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=l+oxpvVPN7+h+pJO6Dk0tGnXSFp4ak9iIv0hb7wFEFo=; b=C6rlhSjmnoad1C
	s/zqAH4+uWGH5RIpj5/eQPUpAGFGMAYyJyq3kO1ot8L/pE9rfBUSzZkMc0BOnpFIQhhgzYDPzqVsR
	OJ58Ys7dWZnilnsHJ4JzCXJYLkUDvlOEI/6Dp5vjWAvh6OJcSF5UH9rpulHRQuDy5xwwmuGLDQpGn
	sqEhD4LwcGSemlDS/AK8WIu9qDyjquBrdwOWJQx5rDKpNnS0NZ+vZu24Oz1kEBwGKmS3Kj1QJszJW
	4A8ksq+qfp0wg9W2w1s77FqC/UlnbJW0Nka1Ut0IAVE5t+2qxI02XOpLFVoGyq10qE9qpweWr8FmK
	QsIIEvQNxwELo3C1dlwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWv0X-00000002Yhj-0fQR;
	Mon, 05 Feb 2024 09:11:17 +0000
Received: from mail.synergyflux.pl ([51.38.99.212])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWv0T-00000002Yf5-1tRE
	for linux-amlogic@lists.infradead.org;
	Mon, 05 Feb 2024 09:11:14 +0000
Received: by mail.synergyflux.pl (Postfix, from userid 1002)
	id 112E825D08; Mon,  5 Feb 2024 09:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synergyflux.pl;
	s=mail; t=1707124272;
	bh=n9RRp8MlabRDJBtJNro49Rmci90RtotaZYZ8+xo6WI4=;
	h=Date:From:To:Subject:From;
	b=yp/A9Hcc3BaH6AhSGzfdFm2U2WcwH5yk6HtMin/fw8BZxcasDxJuN2kxkKEQCvkE4
	 CQqGD2uEIFKlUOSiDWS2XE7PgM2+CYLFW46NtXiQ9JDoLha7Yf/ju5NgOwmf4YkuIh
	 nY+yWg4AM+YsjLAw5qwp0YeTskS/jF0DxOFzoAZe/jd7iPBSCBGA1zCHw7InQ30e75
	 eKaQfOENjXS5AQDpwCffxlaM4lhx31nm3Bv08G5cKC0G9hhvTSOhFJwmD7AO2zmBZ9
	 Dj6Yu+sHVjTWHbiUhiz++VlrIr4+cG2cz+SR4lBfpTEW4fQbNHPKaiyRoSFLJnQwm3
	 zjKCa/DAt+fuA==
Received: by mail.synergyflux.pl for <linux-amlogic@lists.infradead.org>; Mon,  5 Feb 2024 09:10:51 GMT
Message-ID: <20240205074500-0.1.9m.1w6ro.0.0gybe4g8s8@synergyflux.pl>
Date: Mon,  5 Feb 2024 09:10:51 GMT
From: =?UTF-8?Q?"Konrad_Zieli=C5=84ski_"?= <konrad.zielinski@synergyflux.pl>
To: <linux-amlogic@lists.infradead.org>
Subject: Instalacja pv
X-Mailer: mail.synergyflux.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240205_011113_691598_242C1814 
X-CRM114-Status: UNSURE (   0.72  )
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

RHppZcWEIGRvYnJ5LAoKY3p5IHPEhSBQYcWEc3R3byBvdHdhcmNpIG5hIG5pZXpvYm93acSFenVq
xIVjxIUgcm96bW93xJkgbmEgdGVtYXQgZm90b3dvbHRhaWtpPwoKSmFrbyBmaXJtYSBzcGVjamFs
aXp1asSFY2Egc2nEmSB3IGluc3RhbGFjamkgaSBzZXJ3aXNpZSBuYWpsZXBzenljaCBqYWtvxZtj
aW93byBwYW5lbGkgc8WCb25lY3pueWNoIG5hIHJ5bmt1IGNoY2lhxYJieW0gcHJ6ZWRzdGF3acSH
IHByb3BvenljasSZLCBqYWvEhSB3c3DDs2xuaWUgeiB6ZXNwb8WCZW0gcHJ6eWdvdG93YWxpxZtt
eSBkbGEgUGHFhHN0d2Egb2JpZWt0dS4KCkLEmWTEmSB3ZHppxJljem55IHphIHdpYWRvbW/Fm8SH
IG9kIFBhxYRzdHdhIGN6eSBtb8W8ZW15IHBvcm96bWF3aWHEhy4KCgpQb3pkcmF3aWFtCktvbnJh
ZCBaaWVsacWEc2tpIAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtYW1sb2dpYwo=
