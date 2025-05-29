Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00F51C5AD49
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 May 2025 07:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7842l5zObZjQEitHEEw7V/9se3DfLZwDgSU1/eOX6QQ=; b=EWk+oMkrjfkhr0
	o9pTEfP/cmW5Bf7w6ZYz43lLtgeT4zwBIjJV16DfxrNBOCyEfF8zYQj2A8CwIIEi52CqRN2l5gimz
	ROn6txEMFkF075loyadSpZcOgCW1XquG7nYZ/b7X620Xz7z1Dq8vvgpfLG63T7OQxERcHpK+8YQuY
	+eufZokKEMb7wuylmTloevJs1R2Lm9gBJqqdTjxvzU22lFk/Cz3gDdPY4w/8JLgAUcygVbFeVZIFN
	P5Xkp25bmyV9vIijHpeYiFl/5R+3jc/Kqj3Fx2Av0zhmTn5iYm9pmihpXCfC73Pc6sifqFcglkpOd
	Hw0kkrw8F7mSd5A3wg8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKY5W-0000000FDG2-1aaK;
	Thu, 29 May 2025 07:54:06 +0000
Received: from mail.scalenook.pl ([51.91.253.187])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKY44-0000000FD3t-23MY
	for linux-amlogic@lists.infradead.org;
	Thu, 29 May 2025 07:52:37 +0000
Received: by mail.scalenook.pl (Postfix, from userid 1002)
	id A888823DA3; Thu, 29 May 2025 09:51:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=scalenook.pl; s=mail;
	t=1748505120; bh=X+wkoA4YOELW9s6cx2H1FfY99BwZ9fmdzIT3K0wvljE=;
	h=Date:From:To:Subject:From;
	b=gBnekD9r3f6uPMZix/XVu5re4j7IVkGNKOx7V3mh4fZfSILK3O0XT3ApVLx/lOVrL
	 OGLjBBnTRD7r0y2tFarZ07WWjt4dESdElGtfkdoJ3h06zT/ALnL4HlNjEizJC+5XE2
	 +tOfEQjrNPZexJvTNiGNjGCLisYFhB6YoMWoBXD5DeKJ/70N0DXdV0H+2iseMyeIgI
	 vQ8eW1f8erj4/oiya6LSL253V+V8PaXMPc9vIqadCLk+fntc9rylpaPzyw2y76SZel
	 /r3AmRwqqgdw+2V2ODMQQa/n+6FrX9iM9HhA2w+xFbSz9B041Jyin+5sMax0omIFAI
	 4QOwFAaVid/Jg==
Received: by mail.scalenook.pl for <linux-amlogic@lists.infradead.org>; Thu, 29 May 2025 07:51:03 GMT
Message-ID: <20250529084500-0.1.gx.221r2.0.5121yzsm9x@scalenook.pl>
Date: Thu, 29 May 2025 07:51:03 GMT
From: "Renata Nowacka" <renata.nowacka@scalenook.pl>
To: <linux-amlogic@lists.infradead.org>
Subject: =?UTF-8?Q?Ulga_na_sk=C5=82adki_ZUS?=
X-Mailer: mail.scalenook.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_005236_666174_FF6AC7F2 
X-CRM114-Status: UNSURE (  -0.02  )
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

RHppZcWEIGRvYnJ5LCAKCmNoY2lhxYJhYnltIHdza2F6YcSHIFBhxYRzdHd1IG1vxbxsaXdvxZvE
hyB6YXJ6xIVkemFuaWEgYmVuZWZpdGFtaSB3IMWCYXR3eSBzcG9zw7NiLCBwb3ByemV6IG5hc3pl
IGludHVpY3lqbmUgbmFyesSZZHppZSwgamFraW0gamVzdCBrYXJ0YSBsdW5jaG93YS4gCgpOYXN6
ZSBrYXJ0eSBvZmVydWrEhSB3eWdvZMSZLCBvc3pjesSZZG5vxZtjaSBpIHpkcm93ZSB3eWJvcnkg
xbx5d2llbmlvd2UuIERvZmluYW5zb3dhbmllIHBvc2nFgmvDs3cgamVzdCBrb3J6eXN0bmUgZGxh
IG9idSBzdHJvbi4gS2FydHkgbHVuY2ggdG8gZGxhIHByYWNvZGF3Y3kgcmVhbG5lIG9zemN6xJlk
bm/Fm2NpIHcgcG9zdGFjaSB6d29sbmllbmlhIHogWlVTIGRvIDQ1MCB6xYIgbWllc2nEmWN6bmll
IG5hIHByYWNvd25pa2EuIAoKS2FydMSZIG1vxbxuYSBkb8WCYWRvd2HEhyBkb3dvbG7EhSBrd290
xIUsIGEgbmlld3lrb3J6eXN0YW5lIMWbcm9ka2kgbmllIHByemVwYWRhasSFLCBsZWN6IHByemVj
aG9kesSFIG5hIGtvbGVqbnkgbWllc2nEhWMuIAoKTW9nxJkgcHJ6ZWRzdGF3acSHIG9mZXJ0xJks
IGt0w7NyYSBwb3p3b2xpIHpvcHR5bWFsaXpvd2HEhyBrb3N6dHkgaSB6YXBld25pxIcgcHJhY293
bmlrb20gcG/FvMSFZGFueSBiZW5lZml0PwoKClBvemRyYXdpYW0KUmVuYXRhIE5vd2Fja2EKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9n
aWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
