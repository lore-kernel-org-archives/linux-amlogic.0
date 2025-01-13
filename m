Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7875EE7719F
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Jan 2025 08:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PBVOHJugAU6LyfwU/+qLErtFOUsViUko/8I6VrI10MQ=; b=4fXck/auIQ40Ct
	SjT/XW0IWdxmzOsLFom5D14+W4Qun7YeVkctN0jQ0w+f4cQ35HebI+wJGS8oHMw6gMMQKENkooScw
	OYbMrL4s/F9gUZJ/ct/siXlO0LlSYMtlT54J5R4PmWMMMDDXv+u3AOW8TTZ3XfuJEW22H15iSiunK
	3REFLviRf6nED5pWPurghQI6Pl68xDNxVYBjwScdJ+Roil94BbJeHGJMVgdV5VYml3x2213mqtCGs
	4Qfe6hGRUDNj5jZuoKrXl37vgf2DF0fc2PCAqDc2pIVbeeT/YFCvKyO2M1SXst4ZnvU6uvdLWZqZU
	ujITH/g/ySkiNS1CHImw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXGIP-00000004VQG-2wnd;
	Mon, 13 Jan 2025 08:59:41 +0000
Received: from mail.bizplore.pl ([217.61.0.78])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXGF4-00000004UgI-0Zbd
	for linux-amlogic@lists.infradead.org;
	Mon, 13 Jan 2025 08:56:16 +0000
Received: by mail.bizplore.pl (Postfix, from userid 1002)
	id 5421C83B78; Mon, 13 Jan 2025 09:56:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bizplore.pl; s=mail;
	t=1736758569; bh=cD6ZiYZPfnTHveQoLEkQv8j5EP2cE9hI2+tv5HbcV0g=;
	h=Date:From:To:Subject:From;
	b=wAufPQ2nQQSYEqlBV1ftyxh5l5URvRwaZgeVer5BDNcJ86klpHFkvItSGJ9hkLfOm
	 h+POzxW+CzRTwCR0xq7n3zN6akJ3qYVG/Sue0M5O7sFbZw/zvzb/lKD4pMl2LYDFEQ
	 xeObjKtZgFqtbAUyawPqRdBoh7P/4fzrowoDyGBOCNzm+De84qq4eh9i/aBlS/EMBL
	 djd8xVTz1iXEA9kcGAZwodLocQWAKNJO42NYWogPT3RqT0hSUMR5dTEV0oO/F1AhDA
	 Z2k6HVqqVSIMPWGQ9akyuJHm6wvLcWU33We4YFym+h4mFV1v9TO1jlftTtXG6N+TVf
	 c9SCyilVeBHAw==
Received: by mail.bizplore.pl for <linux-amlogic@lists.infradead.org>; Mon, 13 Jan 2025 08:55:22 GMT
Message-ID: <20250113084500-0.1.g.wrj.0.akxq6g95qo@bizplore.pl>
Date: Mon, 13 Jan 2025 08:55:22 GMT
From: "Joanna Pachnau" <joanna.pachnau@bizplore.pl>
To: <linux-amlogic@lists.infradead.org>
Subject: =?UTF-8?Q?Przyznanie_=C5=9Brodk=C3=B3w?=
X-Mailer: mail.bizplore.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_005614_852725_8E690A7F 
X-CRM114-Status: UNSURE (   1.56  )
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

RHppZcWEIGRvYnJ5LAoKcGlzesSZIGRvIFBhxYRzdHdhLCBwb25pZXdhxbwgZG9zdHJ6ZWdhbSBt
b8W8bGl3b8WbxIcgcG96eXNrYW5pYSBkbGEgUGHFhHN0d2EgZG9kYXRrb3d5Y2ggxZtyb2Rrw7N3
IG5hIGR6aWHFgmFsbm/Fm8SHIHogYmFua3UuCgpQb21hZ2FtIHBvenlza2HEhyB3c3BhcmNpZSBm
aW5hbnNvd2UgZGxhIHByemVkc2nEmWJpb3Jjw7N3LCBrdMOzcnp5IHByb3dhZHrEhSBqZWRub29z
b2Jvd8SFIGR6aWHFgmFsbm/Fm8SHIGdvc3BvZGFyY3rEhSBvcmF6IGZpcm0gdyBmb3JtaWUgc3DD
s8WCa2kuIEpha28gc3BlY2phbGlzdGEgbmllendpxIV6YW55IHogxbxhZG55bSBiYW5raWVtIGd3
YXJhbnR1asSZIG5hamxlcHN6ZSB6IG1vxbxsaXd5Y2ggd2FydW5rw7N3LgoKV3NwaWVyYW0gbmEg
a2HFvGR5bSBldGFwaWUgd25pb3Nrb3dhbmlhIG9yYXogdyB3eXBlxYJuaWVuaXUgd3N6eXN0a2lj
aCBmb3JtYWxub8WbY2kuCgpDaGNlY2llIFBhxYRzdHdvIG5pZXpvYm93acSFenVqxIVjbyBzcHJh
d2R6acSHIGRvc3TEmXBuZSBvcGNqZSB6IHLDs8W8bnljaCBwbGFjw7N3ZWs/CgoKUG96ZHJhd2lh
bQpKb2FubmEgUGFjaG5hdQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtYW1sb2dpYwo=
