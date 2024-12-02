Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79769D10DD1
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 Dec 2024 09:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+1bYS5V199PEaB597p1j6H/4eRpBPh33DaguTRC5EM0=; b=dEIjtqGesUxWP9
	0pIVHMb3e9a0mLjzStKxus8/SrHjbp1jP0DVb1C95rHXQjlqk19jHJ13LZ7n3Bs+13QC23nHmD3ko
	sBfWjUnvVD7hJNsy+4SPLz/nHi4cmAOyTjIwgHpoL0a7uthViYw3FYsCWE0IPGG//6O7D054nr5Z5
	L8+3y9s0WJvK4Mm6oW+bhA0ElS8KurKaYpEnWxMluznbJLemMVSC0j0XbARdnR++5hKVxK7PQTheY
	zAvti592MBrtD8ufX5tC2lrp/JcU9/qqZ8ooi7flOM4jh6sIxwDFJ3Kt76t1SWho8UmByKS4Mntcu
	7GgM8CoXQ105wWCeWMBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI2Rs-00000005WAr-0XTM;
	Mon, 02 Dec 2024 09:10:32 +0000
Received: from mail.finteras.pl ([5.249.155.118])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI2Rp-00000005W9d-1MWL
	for linux-amlogic@lists.infradead.org;
	Mon, 02 Dec 2024 09:10:30 +0000
Received: by mail.finteras.pl (Postfix, from userid 1002)
	id 0C14C83243; Mon,  2 Dec 2024 10:10:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=finteras.pl; s=mail;
	t=1733130628; bh=4SsVKfavNtEL8KiAyuhM0WdCxWV7dwsn0eOpgkwr5fY=;
	h=Date:From:To:Subject:From;
	b=bq3OqcynGndPP+8hJAvhHZ2DKXwDe1R3AJ9aWqaV4pH/vYaFfDYD6YCcf7GYM1gFn
	 Z6Mk4x+s7bJNCdwHqEKTWb1PTW060jWToFx8x5voVHblElMzIcLTOUpfeowdSCERtO
	 KK1U8/egunG+efDvIhluIPFZkAY9JiRzbKrnkYDqtz0cDS+5KVXQeUzLfVcPvyhdBn
	 +Vccy/2cK9aqlitOpcp7XxRR80X3LVVyspCgaOOJ1rbzFfHtZ5NKBITQPjo/JLR09m
	 PjEZsW6R1vGvO7JKvQDiWSpKDkRLq395KdNMKxM/r8OmRAbxPnoF3eWcYe+9Zo6BOb
	 +HHnETZjUXfNA==
Received: by mail.finteras.pl for <linux-amlogic@lists.infradead.org>; Mon,  2 Dec 2024 09:10:21 GMT
Message-ID: <20241202084500-0.1.57.6rlt.0.3g6adr7ubw@finteras.pl>
Date: Mon,  2 Dec 2024 09:10:21 GMT
From: "Urszula Kurach" <urszula.kurach@finteras.pl>
To: <linux-amlogic@lists.infradead.org>
Subject: =?UTF-8?Q?Pakiety_telemedyczne_dla_pracownik=C3=B3w?=
X-Mailer: mail.finteras.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_011029_508031_783A8451 
X-CRM114-Status: UNSURE (   1.26  )
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

U3phbm93bmkgUGHFhHN0d28sCgpjaGNpYcWCYWJ5bSB6YXB5dGHEhywgY3p5IGJ5bGlieSBQYcWE
c3R3byB6YWludGVyZXNvd2FuaSBkb3N0xJlwZW0gZG8gbmllbGltaXRvd2FuZWogb3BpZWtpIHRl
bGVtZWR5Y3puZWogcGVkaWF0cnksIG9ydG9wZWR5LCBuZXVyb2xvZ2Egb3JheiBsZWthcnp5IHdp
ZWx1IGlubnljaCBzcGVjamFsaXphY2ppPwoKT2ZlcnVqZW15IDMgcsOzxbxuZSBwYWtpZXR5LCBr
dMOzcmUgemFwZXduaWFqxIUgZG9zdMSZcCBkbyB1c8WCdWcgZG9wYXNvd2FueWNoIGRvIHBvdHJ6
ZWIgUGHFhHN0d2EgZmlybXkuIFBha2lldCBwb2RzdGF3b3d5IGRhamUgbW/FvGxpd2/Fm8SHIGtv
cnp5c3RhbmlhIHoga29uc3VsdGFjamkgaW50ZXJuaXN0eSBuYXdldCB3IHdlZWtlbmR5IGkgxZt3
acSZdGEsIG5hdG9taWFzdCBwYWtpZXQgcGXFgm55IG9iZWptdWplIGRvc3TEmXAgZG8gbGVrYXJ6
eSA0MiBzcGVjamFsaXphY2ppLCBhIHRha8W8ZSBhdHJha2N5am5lIHJhYmF0eSBuYSBiYWRhbmlh
IGxhYm9yYXRvcnlqbmUgaSBkaWFnbm9zdHlrxJkgb2JyYXpvd8SFLgoKRHppxJlraSB0YWtpbSBy
b3p3acSFemFuaW9tLCBQYcWEc3R3YSBwcmFjb3duaWN5IHp5c2thasSFIHdhcnRvxZtjaW93eSBi
ZW5lZml0IHBvemFwxYJhY293eSwgYSBmaXJtYSB6eXNrYSB6bW90eXdvd2FueSB6ZXNww7PFgiwg
bW5pZWogYWJzZW5jamkgY2hvcm9ib3d5Y2ggaSBkb2RhdGtvd2Ugb3N6Y3rEmWRub8WbY2kuCgpD
enkgbW9nxJkgcHJ6ZWRzdGF3acSHIHdpxJljZWogc3pjemVnw7PFgsOzdyBuYSB0ZW1hdCBkb3N0
xJlwbnljaCBwYWtpZXTDs3c/CgoKUG96ZHJhd2lhbQpVcnN6dWxhIEt1cmFjaAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWls
aW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
