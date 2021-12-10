Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBCABC433EF
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 Dec 2021 11:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Cc:Date:Message-Id:Subject:
	Mime-Version:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=wKMWw9smV/3SZb14ygjNcXIXCZYSFYQ5Cgjpl7AIqvc=; b=euu
	1mNiIS88pOjMjZtQ++7g9Cg5lp1Iw3kjwUVu2d6vxPVTpEs0KTGf1yTGOlWi9AJYHWLKEtRGiMHXN
	ORYyc2rs57Br+KSprdW8MOq+KnPQWqasur/Tw/X/x/g5jzJuvVfpMuxYifm7swndIEqAQh2KnDrr4
	EHxbzky7nD6RiIm91wOIRNQ/9UdbzfRUIOz7gXf5myyblJ9WekNb9Q/1h8dG1M3OeCS/WTddVumHi
	At8g/vXceWi91eytVDcBye+RtBLLJOSlMyg9hTlQ9uzP5iT1bArtF4wBqZAFuE8loXIrHtf9Hb0Qc
	gZOP6isjT/ULw3fANxcnjeLVahHKpZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvdk2-001amc-15; Fri, 10 Dec 2021 11:07:06 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvdjy-001ala-Ch
 for linux-amlogic@lists.infradead.org; Fri, 10 Dec 2021 11:07:04 +0000
Received: by mail-wm1-x331.google.com with SMTP id y196so6511785wmc.3
 for <linux-amlogic@lists.infradead.org>; Fri, 10 Dec 2021 03:06:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :cc:to; bh=x9gEq6s4SQ/Y/FxoC+bzykQK0mZXKAzCdkeCzV1aA48=;
 b=PzE8wHJ5AA4Vg/9XGrhH4yAo5g4vnZzwcLKYrlFvcR4JNyvCIBHTLr4TIhwN4qxum1
 kMOxslNDujtntCR/TzSk3LiD/JSJndwUBsiCXZB89M+VbMzPEwQ1bKSMF7mh4KdRQL93
 7ARWd4oMGvhRzIecK7lo0kzJZIGrbQfN7Yc+mWIO8JW/eakLaAuXl98jtlerDeVEUh1y
 b5tl3G/sh59ZvYAcLRLZWNx9M+2e4cCbg5Qxrgkz5Vvhohixxj7J0fptwNA0n/WbBj2a
 d1TG84Fiph/jO81Rvlgt7x8r3TAJvM0M7F9K6gzVrZWm26H7CJOLZ3EsM6i2ZXUr/tD2
 KNQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:cc:to;
 bh=x9gEq6s4SQ/Y/FxoC+bzykQK0mZXKAzCdkeCzV1aA48=;
 b=kItIYaWO6vkIUOAyMZk4GXWuSUCdduQVmTjP19fq8weazknz5oudgHkbucslZDZCas
 fspBzsiu5WrPcuW0aegoiysBy4JUWZJQ3O1nk2SrwbALyYHGFLEJAmAnE8MP3nTTgsej
 LiPhclTvHctbahl6VoRSq5bP7wMIUYf8FWBz7u6JW84PnoQBgBmDnchlNGPZsTzp1fbh
 xTvv4VpcYnydoOp7eXP+5gnzzkgAehwOtaUn1jd5wNbfCF5UCr4djahkObwXysu6BEdw
 xa9NHUmqgw+ZE4CZWDr+N5UtxxMhPe8aDp8898ythd/tXDMrsA4l2HPLYldrMHK6heAQ
 uZ8w==
X-Gm-Message-State: AOAM5338iGo6eJH4snH0HeXIdEhKcuF7F1MHASaFefZ4x4orgZVbJeVq
 dHFO+j9QtLAxt8oKR1XYSaM=
X-Google-Smtp-Source: ABdhPJwI++kvSmDLzeExD7eKzUBdlEK2U4U5g+Q0LUpop3GCZumCJMuSR2LQoGCxbBrwgOu59XJ3Og==
X-Received: by 2002:a1c:7309:: with SMTP id d9mr6727518wmb.172.1639134418400; 
 Fri, 10 Dec 2021 03:06:58 -0800 (PST)
Received: from [10.127.0.11] ([167.99.200.149])
 by smtp.gmail.com with ESMTPSA id x1sm2293334wru.40.2021.12.10.03.06.57
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 10 Dec 2021 03:06:58 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.7\))
Subject: Amlogic DPCM audio card(s) speaker placement issue
Message-Id: <10DB0841-1BBB-4F06-A2A1-2B25D48A5F72@gmail.com>
Date: Fri, 10 Dec 2021 15:06:55 +0400
Cc: Matthias Reichl <hias@horus.com>,
 Jerome Brunet <jbrunet@baylibre.com>
To: alsa-devel@alsa-project.org,
 linux-amlogic@lists.infradead.org
X-Mailer: Apple Mail (2.3608.120.23.2.7)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211210_030702_471810_D1D14FE2 
X-CRM114-Status: UNSURE (   8.83  )
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

SGVsbG8gYWxzYS1kZXYgLyBsaW51eC1hbWxvZ2ljLAoKSeKAmWQgbGlrZSB0byBkZXNjcmliZSBh
IHByb2JsZW0gd2l0aCBzcGVha2VyIHBsYWNlbWVudCBzZWVuIHdpdGggdGhlIEFtbG9naWMKKG1l
c29uKSBBSVUgYW5kIEFYRyBhdWRpbyBkcml2ZXJzLiBQbGF5aW5nIG1lZGlhIGluIEtvZGkgSeKA
mWQgbm90aWNlZCB0aGF0CnBsYWNlbWVudCBpcyBjb25zaXN0ZW50bHkgd3Jvbmc7IG1lYW5pbmcg
dGhlIGluY29ycmVjdCBwbGFjZW1lbnQgcmVtYWlucwp0aGUgc2FtZSBvdmVyIGRpZmZlcmVudCBt
ZWRpYSBhbmQgQW1sb2dpYyBoYXJkd2FyZXMuCgpUaGlzIHdhcyB0cmFjZWQgdG8gYSBmYWlsdXJl
IHRvIGdldCB0aGUgY2hhbm5lbCBtYXAgdmlhIHNuZF9wY21fZ2V0X2NobWFwKCkKYW5kIGZ1cnRo
ZXIgYW5hbHlzaXMgc2hvd2VkIHRoaXMgZmFpbGVkIGJlY2F1c2UgdGhlIFBDTSBjb250cm9scyBh
cmUgZXhwb3NlZApvbiBhIGRpZmZlcmVudCBkZXZpY2UgdGhhbiB0aGUgUENNIHN0cmVhbS4KCmUu
Zy4gb24gTGlicmVUZWNoIExlUG90YXRvIHdpdGggRFBDTSByb3V0aW5nIGNvbmZpZ3VyZWQgZm9y
IEhETUkgb3V0cHV0LAp0aGUgaHcgUENNIGlzIG9uIHRoZSBzaW5nbGUgZnJvbnRlbmQgZGV2aWNl
IDAgYnV0IHRoZSBQQ00gY29udHJvbHMgYXJlCm9uIGRldmljZSAyOgoKTGVQb3RhdG86fiAjIGFw
bGF5IC1sCioqKiogTGlzdCBvZiBQTEFZQkFDSyBIYXJkd2FyZSBEZXZpY2VzICoqKioKY2FyZCAw
OiBMSUJSRVRFQ0hDQyBbTElCUkVURUNILUNDXSwgZGV2aWNlIDA6IGZlLmRhaS1saW5rLTAgKCop
IFtdCiAgU3ViZGV2aWNlczogMS8xCiAgU3ViZGV2aWNlICMwOiBzdWJkZXZpY2UgIzAKCkxlUG90
YXRvOn4gIyBhbWl4ZXIgY29udHJvbHMKbnVtaWQ9MTksaWZhY2U9TUlYRVIsbmFtZT0nUENNIFBs
YXliYWNrIFZvbHVtZScKbnVtaWQ9MTgsaWZhY2U9TUlYRVIsbmFtZT0nQUNPREVDIExlZnQgREFD
IFNlbCcKbnVtaWQ9NyxpZmFjZT1NSVhFUixuYW1lPSdBQ09ERUMgTXV0ZSBSYW1wIFN3aXRjaCcK
bnVtaWQ9MixpZmFjZT1NSVhFUixuYW1lPSdBQ09ERUMgUGxheWJhY2sgQ2hhbm5lbCBNb2RlJwpu
dW1pZD0zLGlmYWNlPU1JWEVSLG5hbWU9J0FDT0RFQyBQbGF5YmFjayBTd2l0Y2gnCm51bWlkPTQs
aWZhY2U9TUlYRVIsbmFtZT0nQUNPREVDIFBsYXliYWNrIFZvbHVtZScKbnVtaWQ9NSxpZmFjZT1N
SVhFUixuYW1lPSdBQ09ERUMgUmFtcCBSYXRlJwpudW1pZD0xNyxpZmFjZT1NSVhFUixuYW1lPSdB
Q09ERUMgUmlnaHQgREFDIFNlbCcKbnVtaWQ9OCxpZmFjZT1NSVhFUixuYW1lPSdBQ09ERUMgVW5t
dXRlIFJhbXAgU3dpdGNoJwpudW1pZD02LGlmYWNlPU1JWEVSLG5hbWU9J0FDT0RFQyBWb2x1bWUg
UmFtcCBTd2l0Y2gnCm51bWlkPTEsaWZhY2U9TUlYRVIsbmFtZT0nQUlVIEFDT0RFQyBJMlMgTGFu
ZSBTZWxlY3QnCm51bWlkPTE2LGlmYWNlPU1JWEVSLG5hbWU9J0FJVSBBQ09ERUMgT1VUIEVOIFN3
aXRjaCcKbnVtaWQ9MTUsaWZhY2U9TUlYRVIsbmFtZT0nQUlVIEFDT0RFQyBTUkMnCm51bWlkPTE0
LGlmYWNlPU1JWEVSLG5hbWU9J0FJVSBIRE1JIENUUkwgU1JDJwpudW1pZD0xMyxpZmFjZT1NSVhF
UixuYW1lPSdBSVUgU1BESUYgU1JDIFNFTCcKbnVtaWQ9MTIsaWZhY2U9UENNLG5hbWU9J0VMRCcs
ZGV2aWNlPTIKbnVtaWQ9MTEsaWZhY2U9UENNLG5hbWU9J0lFQzk1OCBQbGF5YmFjayBEZWZhdWx0
JyxkZXZpY2U9MgpudW1pZD0xMCxpZmFjZT1QQ00sbmFtZT0nSUVDOTU4IFBsYXliYWNrIE1hc2sn
LGRldmljZT0yCm51bWlkPTksaWZhY2U9UENNLG5hbWU9J1BsYXliYWNrIENoYW5uZWwgTWFwJyxk
ZXZpY2U9MgoKaHR0cHM6Ly9naXRodWIuY29tL3RvcnZhbGRzL2xpbnV4L2Jsb2IvbWFzdGVyL2Fy
Y2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1neGwtczkwNXgtbGlicmV0ZWNoLWNjLmR0
cyNMMTM2LUwxODgKCm9yIG9uIGEgV2V0ZWsgUGxheSAyOgoKV1AyOn4gIyBhcGxheSAtbAoqKioq
IExpc3Qgb2YgUExBWUJBQ0sgSGFyZHdhcmUgRGV2aWNlcyAqKioqCmNhcmQgMDogV0VURUtQTEFZ
MiBbV0VURUstUExBWTJdLCBkZXZpY2UgMDogZmUuZGFpLWxpbmstMCAoKikgW10KICBTdWJkZXZp
Y2VzOiAxLzEKICBTdWJkZXZpY2UgIzA6IHN1YmRldmljZSAjMApjYXJkIDA6IFdFVEVLUExBWTIg
W1dFVEVLLVBMQVkyXSwgZGV2aWNlIDE6IGZlLmRhaS1saW5rLTEgKCopIFtdCiAgU3ViZGV2aWNl
czogMS8xCiAgU3ViZGV2aWNlICMwOiBzdWJkZXZpY2UgIzAKCldQMjp+ICMgYW1peGVyIGNvbnRy
b2xzCm51bWlkPTcsaWZhY2U9TUlYRVIsbmFtZT0nUENNIFBsYXliYWNrIFZvbHVtZScKbnVtaWQ9
NixpZmFjZT1NSVhFUixuYW1lPSdBSVUgSERNSSBDVFJMIFNSQycKbnVtaWQ9NSxpZmFjZT1NSVhF
UixuYW1lPSdBSVUgU1BESUYgU1JDIFNFTCcKbnVtaWQ9NCxpZmFjZT1QQ00sbmFtZT0nRUxEJyxk
ZXZpY2U9NApudW1pZD0zLGlmYWNlPVBDTSxuYW1lPSdJRUM5NTggUGxheWJhY2sgRGVmYXVsdCcs
ZGV2aWNlPTQKbnVtaWQ9MixpZmFjZT1QQ00sbmFtZT0nSUVDOTU4IFBsYXliYWNrIE1hc2snLGRl
dmljZT00Cm51bWlkPTEsaWZhY2U9UENNLG5hbWU9J1BsYXliYWNrIENoYW5uZWwgTWFwJyxkZXZp
Y2U9NAoKaHR0cHM6Ly9naXRodWIuY29tL3RvcnZhbGRzL2xpbnV4L2Jsb2IvbWFzdGVyL2FyY2gv
YXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1neGJiLXdldGVrLXBsYXkyLmR0cyNMNTEtTDk3
CgpJdCBsb29rcyBsaWtlIHRoZSBQQ00gY29udHJvbHMgb2YgdGhlIGJhY2tlbmQgaGRtaS1jb2Rl
YyBhcmUgbm90IHJvdXRlZAp0aHJvdWdoIHRoZSBEUENNIGRyaXZlciB0aGUgc2FtZSB3YXkgYXMg
UENNIHN0cmVhbXMuIFdlIGRpc2N1c3NlZCB0aGF0Cmlzc3VlIHdpdGggSmVyb21lLCB0aGUgZHJp
dmVyIGF1dGhvciwgYnV0IGl04oCZcyBub3QgY2xlYXIgd2hpY2ggYml0cyB3ZQphcmUgbWlzc2lu
Zy4gaS5lLiBpZiBpdCdzIHNvbWV0aGluZyBBU29DIERQQ00gc2hvdWxkIGJlIGhhbmRsaW5nIG9y
IGlmCnNvbWUgZnVydGhlciBwbHVtYmluZyBpbiB0aGUgY2FyZCBkcml2ZXIgb3IgdXNlcnNwYWNl
IGlzIG5lZWRlZD8KCkFueSBoaW50cyBpbnRvIHRoZSByaWdodCBkaXJlY3Rpb24gd291bGQgYmUg
aGlnaGx5IGFwcHJlY2lhdGVkIQoKQ2hyaXN0aWFuCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgt
YW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
