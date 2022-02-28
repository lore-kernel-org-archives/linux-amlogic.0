Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04DF2C433EF
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Feb 2022 06:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=enIUllLGInufBJqALbVnQGSiHUsTDHtUChKC91eTdKc=; b=kQM8g7hyKxav9J
	bt6bH//3huz6YLdijuuK+0EReSlS6tCblayLSC2kgdRVjcJoHJvqBDuYPB1yLR+J9xPQbuWitN+Hd
	UHT0zmOFlWEktFXM7u1CJFSV39EnaEW4mxVnCk7YbK94lyX7Y0B3Y7tneUbxCFZOOcNvigua7l4Ih
	LtNmhoj/t9+jFmu/lOPBsIhIKtO+WMeocBWbS8boXZEBhtDddi1tB9APa2dQI7T5cBgxXitIhy2Jp
	Y8j7xWLn2Ad8m9ny5cUetsRYtKmJcTEWZWKtsNjNaGHrPRI5BSiP7B5Mk1IyWRdX44QeGUjUplVR8
	JPQfY+Sjj5Uin1RzMP+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOZre-00Avm9-3Q; Mon, 28 Feb 2022 06:50:34 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOZrb-00Avlg-7T
 for linux-amlogic@lists.infradead.org; Mon, 28 Feb 2022 06:50:32 +0000
Received: from droid06.amlogic.com (10.18.11.248) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2176.14; Mon, 28 Feb 2022
 14:50:27 +0800
From: Yu Tu <yu.tu@amlogic.com>
To: <linux-serial@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jirislaby@kernel.org>, Yu Tu <yu.tu@amlogic.com>, kernel test robot
 <lkp@intel.com>
Subject: [PATCH] tty: serial: meson: Fix the compile link error reported by
 kernel test robot
Date: Mon, 28 Feb 2022 14:49:10 +0800
Message-ID: <20220228064910.11636-1-yu.tu@amlogic.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-Originating-IP: [10.18.11.248]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220227_225031_315208_0DB8E055 
X-CRM114-Status: UNSURE (   6.50  )
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

RGVzY3JpYmVzIHRoZSBjYWxjdWxhdGlvbiBvZiB0aGUgVUFSVCBiYXVkIHJhdGUgY2xvY2sgdXNp
bmcgYSBjbG9jawpmcmFtZS4gRm9yZ290IHRvIGFkZCBpbiBLY29uZmlnIGtlcm5lbCB0ZXN0IFJv
Ym90IGNvbXBpbGF0aW9uIGVycm9yCmR1ZSB0byBDT01NT05fQ0xLIGRlcGVuZGVuY3kuCgpGaXhl
czogNDQwMjNiOGUxZjE0ICgidHR5OiBzZXJpYWw6bWVzb246IERlc2NyaWJlcyB0aGUgY2FsY3Vs
YXRpb24gb2YgdGhlIFVBUlQgYmF1ZCByYXRlIGNsb2NrIHVzaW5nIGEgY2xvY2sgZnJhbWXigJwp
ClJlcG9ydGVkLWJ5OiBrZXJuZWwgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4KU2lnbmVkLW9m
Zi1ieTogWXUgVHUgPHl1LnR1QGFtbG9naWMuY29tPgotLS0KIGRyaXZlcnMvdHR5L3NlcmlhbC9L
Y29uZmlnIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL3R0eS9zZXJpYWwvS2NvbmZpZyBiL2RyaXZlcnMvdHR5L3NlcmlhbC9LY29uZmln
CmluZGV4IGU5NTJlYzVjN2E3Yy4uYTBmMmI4MmZjMThiIDEwMDY0NAotLS0gYS9kcml2ZXJzL3R0
eS9zZXJpYWwvS2NvbmZpZworKysgYi9kcml2ZXJzL3R0eS9zZXJpYWwvS2NvbmZpZwpAQCAtMjAw
LDYgKzIwMCw3IEBAIGNvbmZpZyBTRVJJQUxfS0dEQl9OTUkKIGNvbmZpZyBTRVJJQUxfTUVTT04K
IAl0cmlzdGF0ZSAiTWVzb24gc2VyaWFsIHBvcnQgc3VwcG9ydCIKIAlkZXBlbmRzIG9uIEFSQ0hf
TUVTT04gfHwgQ09NUElMRV9URVNUCisJZGVwZW5kcyBvbiBDT01NT05fQ0xLCiAJc2VsZWN0IFNF
UklBTF9DT1JFCiAJaGVscAogCSAgVGhpcyBlbmFibGVzIHRoZSBkcml2ZXIgZm9yIHRoZSBvbi1j
aGlwIFVBUlRzIG9mIHRoZSBBbWxvZ2ljCgpiYXNlLWNvbW1pdDogYzJmYWY3MzdhYmZiMTBmODhm
MmQyNjEyZDU3M2U5ZWRjM2M0MmMzNwotLSAKMi4zMy4xCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGlu
dXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
