Return-Path: <SRS0=FRsS=6H=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 831DEC55185
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Apr 2020 00:39:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 57AF82076C
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Apr 2020 00:39:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LicwsH6o";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mj30sjvr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 57AF82076C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HlFaMhKZvAuOTs8V+4MfOGmmCgGK8Z7lFE94NBd2Qq4=; b=LicwsH6o/5fZkk
	Moq/43d1jkby9fi2BfdNkFgXYhL4jLVTrVN40ebOjEF78vo+n+TrGTBOpChTbSuxRWIojOVPGdw2r
	0SeuMdWybsmSXHGQGwa81mZQkJNnRe1IJKj9z44b3nZ2rmwDBair6HtkHJVcChyDNoZdqeN5cKGcK
	XXgIjKiczyOemj9eUvYAoOBdFvpJjo2KV7BE5MjmuxvXdNYOENLBvkodfLGZPnP+KMCYra12CPVe2
	JyibS+LIUVkKu2U3Qxbee9vK40hjLsP5IccVVda1EoHj920dxiAQ4QJvgRxfr3BgWTIPLqeVQD3NF
	W/niC1iMw6W9Sg2k9bvw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jRPtw-0001E2-Te; Thu, 23 Apr 2020 00:39:36 +0000
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jRPtu-0001CO-VS
 for linux-amlogic@lists.infradead.org; Thu, 23 Apr 2020 00:39:36 +0000
Received: by mail-lf1-x142.google.com with SMTP id g10so3285990lfj.13
 for <linux-amlogic@lists.infradead.org>; Wed, 22 Apr 2020 17:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=5fl4A7nRdQONkc+Ns32BwHf/X7YnX+et/nIg9JJL2zU=;
 b=Mj30sjvrkHvbKMqqfHKFNV5+YQEGBrwRZ0z+4T3vXh7n5MBP9x3dRJ6j2LmHioOge6
 QYB43T4G4zJsbQVQ7BH3EqooNVpHMppSpitVpDBQztmzTnG24oBhFVzD/pbnt9ghXCDO
 lIPvj3hYEECgw/yZYPuNE0KHnYN0oFHy/bnaLJb8G8jh4Pwt0ER9hkd3ECRaHkHJU+iO
 goBbHo0eb/KFYdoDWis9mS1esjCM8LF+3/iN/bWJpmfHjiEIUFmfqjNzVq6UTTEZbD6/
 cq6F+gZvE/nYHjEyGeNUuF/JF95Q6/HLQv3qf/7y4paceeOPZpHl3Ev/446VWEv+B+4b
 IBCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=5fl4A7nRdQONkc+Ns32BwHf/X7YnX+et/nIg9JJL2zU=;
 b=B6BucEsjxF+7PvCEmYb9k2fKzxwR1bS+FjpSRPb5+1iXcyCxvm2ztEG6K/9cQoGvVw
 2TxPDcaDz3F/7Ght6S+3MJ026kpO38+by7W+sYJ29YbmB94crokLF8KmP+3I7zs+VmkS
 A+ZwqXoHva0VVuljZJJJhGzeP3Rha2nOepHDt+N9KlVO1u29x/t/jnnb7evQkocWkp3O
 YgfjyWDIEGIRvKchZ1IDbafvEC+x1kcYbQmvjJ77+cEpCVjabNGHeP0Icw6WIKLgSHeG
 BF/U62eNTbySkmh3vHkNd7ZFbtarRU9DBXLDjEwzNrLA5tPar+m0A9nE5saxSN75wAUN
 XSgA==
X-Gm-Message-State: AGi0Pub/lin3Vgj1urHhOJJKhdVdH1rILCnTYyw5vdAnY362J1+6sFeh
 yf4534ZP83CMAtAiixrEu1g=
X-Google-Smtp-Source: APiQypKEnU1zF7+eWCBcmj0qvCVqLKmZHMNFwVXoZaQrmlJkac50VlkAbDcbpHZOQ6d2aDNMPqqV1g==
X-Received: by 2002:a19:c3c5:: with SMTP id t188mr718181lff.199.1587602373144; 
 Wed, 22 Apr 2020 17:39:33 -0700 (PDT)
Received: from [172.16.20.20] ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id t19sm502360lfl.53.2020.04.22.17.39.30
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 22 Apr 2020 17:39:32 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.14\))
Subject: Re: [PATCH 0/3] Bluetooth: hci_qca: add support for QCA9377
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <D965D634-A881-43E0-B9F8-DF4679BB9C6D@holtmann.org>
Date: Thu, 23 Apr 2020 04:39:24 +0400
Message-Id: <6103BC70-F2AC-4CA5-BF6F-152466AEEBD1@gmail.com>
References: <20200421081656.9067-1-christianshewitt@gmail.com>
 <D965D634-A881-43E0-B9F8-DF4679BB9C6D@holtmann.org>
To: Marcel Holtmann <marcel@holtmann.org>
X-Mailer: Apple Mail (2.3445.104.14)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200422_173935_021517_10A6E40A 
X-CRM114-Status: GOOD (  10.24  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: devicetree <devicetree@vger.kernel.org>,
 Johan Hedberg <johan.hedberg@gmail.com>, netdev <netdev@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Bluez mailing list <linux-bluetooth@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Cj4gT24gMjIgQXByIDIwMjAsIGF0IDk6MzkgcG0sIE1hcmNlbCBIb2x0bWFubiA8bWFyY2VsQGhv
bHRtYW5uLm9yZz4gd3JvdGU6Cj4gCj4gSGkgQ2hyaXN0aWFuLAo+IAo+PiBUaGlzIHNlcmllcyBh
ZGRzIGEgbmV3IGNvbXBhdGlibGUgZm9yIHRoZSBRQ0E5Mzc3IEJUIGRldmljZSB0aGF0IGlzIGZv
dW5kCj4+IGluIG1hbnkgQW5kcm9pZCBUViBib3ggZGV2aWNlcywgbWFrZXMgbWlub3IgY2hhbmdl
cyB0byBhbGxvdyBtYXgtc3BlZWQKPj4gdmFsdWVzIGZvciB0aGUgZGV2aWNlIHRvIGJlIHJlYWQg
ZnJvbSBkZXZpY2UtdHJlZSwgYW5kIHVwZGF0ZXMgYmluZGluZ3MKPj4gdG8gcmVmbGVjdCB0aG9z
ZSBjaGFuZ2VzLgo+PiAKPj4gQ2hyaXN0aWFuIEhld2l0dCAoMyk6Cj4+IGR0LWJpbmRpbmdzOiBu
ZXQ6IGJsdWV0b290aDogQWRkIGRldmljZSB0cmVlIGJpbmRpbmdzIGZvciBRQ0E5Mzc3Cj4+IEJs
dWV0b290aDogaGNpX3FjYTogYWRkIGNvbXBhdGlibGUgZm9yIFFDQTkzNzcKPj4gQmx1ZXRvb3Ro
OiBoY2lfcWNhOiBhbGxvdyBtYXgtc3BlZWQgdG8gYmUgc2V0IGZvciBRQ0E5Mzc3IGRldmljZXMK
Pj4gCj4+IC4uLi9iaW5kaW5ncy9uZXQvcXVhbGNvbW0tYmx1ZXRvb3RoLnR4dCAgICAgICAgIHwg
IDUgKysrKysKPj4gZHJpdmVycy9ibHVldG9vdGgvaGNpX3FjYS5jICAgICAgICAgICAgICAgICAg
ICAgfCAxNyArKysrKysrKysrLS0tLS0tLQo+PiAyIGZpbGVzIGNoYW5nZWQsIDE1IGluc2VydGlv
bnMoKyksIDcgZGVsZXRpb25zKC0pCj4gCj4gdGhlIHNlcmllcyBkb2VzbuKAmXQgYXBwbHkgY2xl
YW5seSBhZ2FpbnN0IGJsdWV0b290aC1uZXh0IHRyZWUuIENhbiB5b3UgcGxlYXNlIHJlc3BpbiBp
dC4KCkFoaCwgaXQgd2FzIGJhc2VkIG9uIDUuNy1yYzEsIHdpbGwgZG8sIHRoYW5rcy4KCkNocmlz
dGlhbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2lj
Cg==
