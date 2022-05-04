Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EA95C433EF
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 May 2022 21:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2BkTNhmxOl+Sr62G9YYVd8MUCzL4vHPjy9jsFfl+ZJ4=; b=IdwjfOxfacxGQS
	wlPbOTUdGa6rcsufzQE0IuOoA5PmX85QORaxXwxWCcnciM4p5Uxhd2ePdYg22f/FjM4uxlnNJKhHZ
	vGMRo1oTmkvJfiZ1Uu+cUniZ1wJ7wUQwzXk353bpjmVQzcJ3O64JIZmqz+5tYTRWGKYUDVh+C8SMB
	b19kmew5DE6JcsivgAB9AeVC0hDqe5IN18OLJHsnZ2hHqVG+5bABNzcexXy8XgEW1wz4c+vC1T5D0
	ZDWdr+tCvXbQwu48rPv5F6Vb3gPZu4fHoCCFLSjvbqI9LhsDWXm11qAD1Yv/wY/q+mbDlr69rIv9A
	4jSP0qwgcVDk3+I/Od/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmMHF-00Cjm6-Ic; Wed, 04 May 2022 21:11:17 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmMHB-00Cjit-K3
 for linux-amlogic@lists.infradead.org; Wed, 04 May 2022 21:11:15 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1651698671;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CKPWYgbYXcfIsG95x1ua8STRPsIFuKN1LA1dfgcwhhA=;
 b=1MWan81qhvKGVvbdBCrUwXV2WiAmiNVsoUUJGH95QqQOMCpw0T4wgYf4A+g2olyc52bhX5
 iPkjnQLkzaMTi6VwTaowiIS8cbMF7deB2YVuXC6CUU1VPuQ0YyXE1YyRKgqSVh1BMx6NGY
 PH7E3XlFBlJH0+YsLdSpZOxcxPkVBmlBZUuac+FRKCc1CbnblGRLezF+pnd2zkQkPYobde
 NaJitdWbNoqLmjxim0r4NRHMYq9KhbymOq1JeraQhNiJCk1xWoFypAIhsCW0HAdWfFsUFL
 3/ne/DduUXaQcaFFNpanLge4E7y8ZnNcJfzhpa8/MiaFMZpTtRXJftD4L7GM8w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1651698671;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CKPWYgbYXcfIsG95x1ua8STRPsIFuKN1LA1dfgcwhhA=;
 b=odQlOZT03eWDUW4JUq55Nq9AyO8/0Gcb6em6qQlxjX+3nYEkdyYhLk80Lhp1/T42KeqlyS
 GYGy6dmQmHzE4bBQ==
To: Marek Szyprowski <m.szyprowski@samsung.com>, Petr Mladek <pmladek@suse.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, Steven Rostedt
 <rostedt@goodmis.org>, Thomas
 Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-amlogic@lists.infradead.org
Subject: Re: [PATCH printk v5 1/1] printk: extend console_lock for
 per-console locking
In-Reply-To: <45849b63-d7a8-5cc3-26ad-256a28d09991@samsung.com>
References: <Ymfgis0EAw0Oxoa5@alley> <Ymfwk+X0CHq6ex3s@alley>
 <CGME20220427070833eucas1p27a32ce7c41c0da26f05bd52155f0031c@eucas1p2.samsung.com>
 <2a82eae7-a256-f70c-fd82-4e510750906e@samsung.com>
 <Ymjy3rHRenba7r7R@alley>
 <b6c1a8ac-c691-a84d-d3a1-f99984d32f06@samsung.com>
 <87fslyv6y3.fsf@jogness.linutronix.de>
 <51dfc4a0-f6cf-092f-109f-a04eeb240655@samsung.com>
 <87k0b6blz2.fsf@jogness.linutronix.de>
 <32bba8f8-dec7-78aa-f2e5-f62928412eda@samsung.com>
 <Ym/Z7PYPqvWPEjuL@alley>
 <45849b63-d7a8-5cc3-26ad-256a28d09991@samsung.com>
Date: Wed, 04 May 2022 23:17:10 +0206
Message-ID: <87pmktm2a9.fsf@jogness.linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_141113_843933_9E2763A6 
X-CRM114-Status: UNSURE (   4.86  )
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

T24gMjAyMi0wNS0wMywgTWFyZWsgU3p5cHJvd3NraSA8bS5zenlwcm93c2tpQHNhbXN1bmcuY29t
PiB3cm90ZToKPiBRRU1VIHZpcnQvYXJtNjQ6Cj4KPiBbwqAgMTc0LjE1NTc2MF0gdGFzazpwci90
dHlBTUEwwqDCoMKgwqDCoCBzdGF0ZTpTIHN0YWNrOsKgwqDCoCAwIHBpZDrCoMKgIDI2IAo+IHBw
aWQ6wqDCoMKgwqAgMiBmbGFnczoweDAwMDAwMDA4Cj4gW8KgIDE3NC4xNTYzMDVdIENhbGwgdHJh
Y2U6Cj4gW8KgIDE3NC4xNTY1MjldwqAgX19zd2l0Y2hfdG8rMHhlOC8weDE2MAo+IFvCoCAxNzQu
MTU3MTMxXcKgIDB4ZmZmZjVlYmJiZmRkNjJkOAoKSSBjYW4gcmVwcm9kdWNlIHRoZSBhcHBhcmVu
dCBzdGFjayBjb3JydXB0aW9uIHdpdGggcWVtdToKClsgICAgNS41NDUyNjhdIHRhc2s6cHIvdHR5
QU1BMCAgICAgIHN0YXRlOlMgc3RhY2s6ICAgIDAgcGlkOiAgIDI2IHBwaWQ6ICAgICAyIGZsYWdz
OjB4MDAwMDAwMDgKWyAgICA1LjU0NTUyMF0gQ2FsbCB0cmFjZToKWyAgICA1LjU0NTYyMF0gIF9f
c3dpdGNoX3RvKzB4MTA0LzB4MTYwClsgICAgNS41NDU3OTZdICBfX3NjaGVkdWxlKzB4MmY0LzB4
OWYwClsgICAgNS41NDYxMjJdICBzY2hlZHVsZSsweDU0LzB4ZDAKWyAgICA1LjU0NjIwNl0gIDB4
MAoKV2hlbiBpdCBoYXBwZW5zLCB0aGUgcHJpbnRrLWt0aHJlYWQgaXMgdGhlIG9ubHkgb25lIHdp
dGggdGhlIGNvcnJ1cHRlZApzdGFjay4gSXQgc2VlbXMgSSBhbSBkb2luZyBzb21ldGhpbmcgd3Jv
bmcgd2hlbiBjcmVhdGluZyB0aGUga3RocmVhZD8gSQp3aWxsIGludmVzdGlnYXRlIHRoaXMuCgpU
aGFua3MgTWFyZWsgZm9yIGhlbHBpbmcgdXMgdG8gbmFycm93IHRoaXMgZG93bi4KCkpvaG4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9n
aWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
