Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 523B3C7EE29
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Jun 2023 08:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vyoyRg7m537cDS6FYIcQqg7TR7G8+kYE+PPQQUol43E=; b=eIe0Iln5SHzmD3
	v0iAVcgylsLdOQU+lhP8MOXYZz26IhZxAEP/e54f4tWmpYtBYZ3rg6JsISBLBl4ZETvLNLHmFFidF
	g7RcdMGgCJ0bFZfXClSNSgJEJyHEr55cdiquwWkIzEbWf+5YaaPr1bOyKxu8hTisgMPzqDYHY0YLV
	0ok4Oq6uzTshVIobpdJ3dBOy1ZlRIWEQAM0xynx8WpETNZrRu1LWnMsGF+rtb+8jLfwhlCU01HFPi
	blodWffB9TqsvEU/QizlJwnZBNEEVre8H0WSiz/eH9sD7sEEaUErJ5Q2RwfB3KGGVdUb0hn+1PQMR
	0g8goKQp4wKDSvKsk/zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q50Gd-006AZ0-08;
	Fri, 02 Jun 2023 08:36:15 +0000
Received: from mail.webtopbits.pl ([195.231.64.176])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q50Ga-006AYH-0m
	for linux-amlogic@lists.infradead.org;
	Fri, 02 Jun 2023 08:36:13 +0000
Received: by mail.webtopbits.pl (Postfix, from userid 1001)
	id E45A4A38F2; Fri,  2 Jun 2023 09:36:02 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=webtopbits.pl;
	s=mail; t=1685694969;
	bh=Eh8ECMiYd4baGAwPAzhz8mhJACXX7NSRkYjh+plaY18=;
	h=Date:From:To:Subject:From;
	b=GVgH8Olj2nnFNNY3kjIxX7TPKYylOIFdJtaMMPrIm0vdrEUez0dfrnCLYajbID/UC
	 TnRP0W3JnGdzTcWfCCYU7c+tn/ioY7nDGLY68SG516zy0m8GgSrsusMlr4DMbloxk4
	 EvuuVach756k+LEkRui8RyfTmAOK19y+mOgb9SRrRe7bh8UfrN7nIJe+4Xa6Two7rz
	 2pzPlQgEBFG4Wx6O1mUUkmZKGc9WeghfgV+GiJUcKrt6e7687hWncVxZGBzlo5ifMn
	 wMEVj0mXSuFVadTnl+IlYbSMV4ysivnYRH+HlxkYtzlyzAt7Bf/k8JryGhLdpnmAqq
	 44cChmI+UXhOQ==
Received: by mail.webtopbits.pl for <linux-amlogic@lists.infradead.org>; Fri,  2 Jun 2023 08:35:59 GMT
Message-ID: <20230602085530-0.1.8w.5k2e.0.c9ii06a89i@webtopbits.pl>
Date: Fri,  2 Jun 2023 08:35:59 GMT
From: "Kamil Durjasz" <kamil.durjasz@webtopbits.pl>
To: <linux-amlogic@lists.infradead.org>
Subject: =?UTF-8?Q?Wy=C5=BCsza_konwersja_w_e-sklepie_?=
X-Mailer: mail.webtopbits.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230602_013612_429550_FD048B66 
X-CRM114-Status: UNSURE (   1.67  )
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

RHppZcWEIGRvYnJ5LAoKdyBqYWtpIHNwb3PDs2IgZG9jaWVyYWrEhSBQYcWEc3R3byBkbyBvZGJp
b3Jjw7N3PwoKVHdvcnp5bXkgcG90xJnFvG5lIG5hcnrEmWR6aWEgc3ByemVkYcW8eSwga3TDs3Jl
IHBvendhbGFqxIUga29tcGxla3Nvd28gcm96d2nEhXphxIcgcHJvYmxlbXkgcG90ZW5jamFsbnlj
aCBrbGllbnTDs3cgaSBza3V0ZWN6bmllIHdwxYJ5bsSFxIcgbmEgaWNoIGRlY3l6amUgemFrdXBv
d2UuIAoKU2t1cGlhbXkgc2nEmSBuYSBQYcWEc3R3YSBwb3RyemViYWNoIHp3acSFemFueWNoIHog
b2JzxYJ1Z8SFIHNrbGVwdSwgb2N6ZWtpd2FuaWFjaCBpIHBsYW5hY2ggc3ByemVkYcW8b3d5Y2gu
IFN6Y3plZ8OzxYJvd28gZG9wYXNvd3VqZW15IGdyYWZpa8SZLCBmdW5rY2pvbmFsbm/Fm2NpLCBz
dHJ1a3R1csSZIGkgbWlrcm9pbnRlcmFrY2plIGRvIFBhxYRzdHdhIGdydXB5IGRvY2Vsb3dlaiwg
Y28gcHJ6ZWvFgmFkYSBzacSZIG5hIG9jemVraXdhbmUgcmV6dWx0YXR5LgoKQ2jEmXRuaWUgcHJ6
ZWRzdGF3acSZIGRvdHljaGN6YXNvd2UgcmVhbGl6YWNqZSwgYWJ5IG1vZ2xpIFBhxYRzdHdvIHBy
emVrb25hxIcgc2nEmSBvIG5hc3p5Y2ggbW/FvGxpd2/Fm2NpYWNoLiBNb2fEmSBzacSZIHNrb250
YWt0b3dhxIc/CgoKUG96ZHJhd2lhbQpLYW1pbCBEdXJqYXN6CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdAps
aW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
