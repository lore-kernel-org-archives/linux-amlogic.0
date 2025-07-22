Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F195C83F25
	for <linux-amlogic@archiver.kernel.org>; Tue, 22 Jul 2025 07:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FlXsi+yhKdQq53VHytWdcPe1Alnjrv3WOBvtKMOwOBw=; b=ovA6k/9RTjKNyq
	piHGx8Pe1/DiItaDfG2skLSqO8JFM3Zb1x5q2MlooE7kK64rTWUnXOzETEbvzEg/gzEbh0TRiuMh+
	0B2xFhHZclwDBDrqYgk8KXMnM5k/7mP2CCbqIg611uvRFlIR4R0RbsaRgjUu3uEwYcQ6AB6RwfSrs
	3eur635E8efPrmrrkGyCHf64lB1HeoXOZeAo+LgZHFUxhvE6jQRB4Ztm8XTdvRNC/novuiQKS2vCq
	Pgz7hcoWvgawbuXV11fpl6gH6ZjKJhuWqK4bf6vOJPB+gMoI98JSvOr+zH7NXWhJaPUBBQdtoUQli
	mkf4XzMquS6uJtnIfX4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue7jU-00000001jC1-2bKc;
	Tue, 22 Jul 2025 07:48:16 +0000
Received: from mail.capitalcraft.pl ([57.129.67.144])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue7d3-00000001i2C-1sYz
	for linux-amlogic@lists.infradead.org;
	Tue, 22 Jul 2025 07:41:38 +0000
Received: by mail.capitalcraft.pl (Postfix, from userid 1002)
	id 5BA462335E; Tue, 22 Jul 2025 07:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=capitalcraft.pl;
	s=mail; t=1753170093;
	bh=HDVkD9F9d0LNuXby99FgApyHr5MULFRdKL2PW8Qg/Vo=;
	h=Date:From:To:Subject:From;
	b=hWy2gtB4al1Lp7YeUBLjJyv+0Z9Cqe+O3hCNaMfwE6iSVeHlznCQt8l6BL5tKnpWQ
	 ks67xAZ699h+fiRjt5f3pZxWOuDa3rzg8LlsVDwl7MV2+oAD1vkZkLV7Pt5MuWM9px
	 zWtbnAttUrE3MNRf+403NfQU5teFv8V0gaxUyK8g8Vx/Gr5bFxLb9Ib7pPwUbUtFnI
	 wqlSg5Qcu4TWQZpUOKSpPp2EDIA4cmmXjQd+UUzK5TSnC61oEMTcwXFgeqcuRXogyk
	 R075VKac108ksxZLbjiyye+gyXmuLhJa21Mz64fvMO2gnO2O9AzGh4lmf681k0hHUI
	 PYmsJIEkBUI5A==
Received: by mail.capitalcraft.pl for <linux-amlogic@lists.infradead.org>; Tue, 22 Jul 2025 07:40:58 GMT
Message-ID: <20250722064501-0.1.3k.lbh4.0.yilkbqcj1f@capitalcraft.pl>
Date: Tue, 22 Jul 2025 07:40:58 GMT
From: "Karolina Dylkiewicz" <karolina.dylkiewicz@capitalcraft.pl>
To: <linux-amlogic@lists.infradead.org>
Subject: Ochrona pracodawcy - prawo pracy
X-Mailer: mail.capitalcraft.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_004137_766340_B701556F 
X-CRM114-Status: UNSURE (   1.13  )
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

RHJvZHp5IFByemVkc2nEmWJpb3JjeSwKCncgcHJha3R5Y2UgcHJhd2EgcHJhY3kgZ3JhbmljYSBt
acSZZHp5IGZvcm1hbG5vxZtjaWFtaSBhIHJ5enlraWVtIHBvdHJhZmkgYnnEhyBjaWVua2Eg4oCT
IGEgamVkZW4gbmllcHJ6ZW15xZtsYW55IHphcGlzIG1vxbxlIG1pZcSHIGtvc3p0b3duZSBrb25z
ZWt3ZW5jamUuCgrFmndpYWRjesSZIHN0YcWCxIUgb2JzxYJ1Z8SZIHByYXduxIUgdyB6YWtyZXNp
ZSBwcmF3YSBwcmFjeSDigJMgdGFrLCBiecWbIG1pYcWCIHBld25vxZvEhywgxbxlIFR3b2plIGR6
aWHFgmFuaWEgamFrbyBwcmFjb2Rhd2N5IHPEhSBiZXpwaWVjem5lIGkgZG9icnplIHVkb2t1bWVu
dG93YW5lLiAKCkR6aWHFgmFtIHNwcmF3bmllLCByemVjem93byBpIGJleiBuYWRtaWFydSBmb3Jt
YWxub8WbY2kg4oCTIHdpxJlrc3pvxZvEhyBzcHJhdyByb3p3acSFenVqZW15IHphbmltIHVyb3Nu
xIUgZG8gcmFuZ2kgcHJvYmxlbXUuCgpDenkgbW9nxJkgcHJ6ZWRzdGF3acSHIHBlxYJlbiB6YWty
ZXMgbmFzemVnbyB3c3BhcmNpYT8KCgpQb3pkcmF3aWFtCkthcm9saW5hIER5bGtpZXdpY3oKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9n
aWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
