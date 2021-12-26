Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13A0BC433EF
	for <linux-amlogic@archiver.kernel.org>; Sun, 26 Dec 2021 11:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Cc:Date:Message-Id:Subject:
	Mime-Version:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=qzGd8J4uAJJMK7Idpqq24JMuw0B2vhzBKNloaezKlzA=; b=vnW
	OzNNFmD76EOZUj+GdmrGtXvKsXR0PZeEgEL0p2lJeHanMrBopMDTDnmasU8oKQTRYzkV08XMe/bw5
	LD60+vOF3tp4Zu0RzJjN30LCYhhLsMamxX15trAvucUtyDPEUkjUb2WEzZtHe7t+xVgBXR9GEXxqt
	z8uof9HUbS+As38ndyALq76bm8j7QqtgVAPmdXWvRyh9puCMbqn3JVLDG/I4zk/Q4cRUlDPz4tnXy
	r/4ypKNFSEbUC4P4w/7O04st3JiNKVhi/JwBa/03urIud5QiaMDAjLhIoBCWR2kx+MesEAz2aZ6ii
	uwhOAvjnrhVONhZHYiAR+FqbacMavlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n1RwL-00FXkR-6P; Sun, 26 Dec 2021 11:43:49 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n1RwI-00FXjs-2Y
 for linux-amlogic@lists.infradead.org; Sun, 26 Dec 2021 11:43:47 +0000
Received: by mail-ed1-x535.google.com with SMTP id f5so50832547edq.6
 for <linux-amlogic@lists.infradead.org>; Sun, 26 Dec 2021 03:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :cc:to; bh=Gdbc0mKAWHgP6myoIpSCmJEHf+phJi1GxRoRstMmo+s=;
 b=HE0ks3fHCcBPdeyPIsoifbqDZTGd8GnRRPwU2R8IvLNjkEoqt26zVzelv8b3DMT/P1
 1aMiizHMDNdnDW6j3jFnHETBELy0POxOuHENpxkFAZqhxzX4zg5eUZ/Jo9hcW0wqBy7s
 8ycAlF/ND6bMxCMqcLm5zVwacMqkQD3CTT/v3rkYh+qprPF6vG9MdaCfweBbV5pwdazx
 ZfpkhPvZohyMpb5npoh9RC1SesZeBRSTmKmWL1XGtYsExS8db3S36gSBU03Fk8B208Mp
 VeUEvcSFYQZitsDO2ta9QWEn/srAfNrHG39rz9ez8Tktcx0PakqHsWmc18qNkYZ5+SZQ
 PFzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:cc:to;
 bh=Gdbc0mKAWHgP6myoIpSCmJEHf+phJi1GxRoRstMmo+s=;
 b=SMY+Ay7KGNTwSGTJ15/4gh5YcRoj20fc52bmMHBgxOmpYGfCfbwMn2nXK7vhXN8o/X
 1iVEIefHD8l/NTxqALKD5B55UIJI0ePq7cxOpuPWiR57QcfSGPQ9f7hMmw/OfyK6PM7p
 2aa5g2Rar0T9hDSntRJ+ss2OfwxsXEhDB+2vDZera7tXd711sqzhvehZi57l1RUjhviu
 vKOdVjdY6RZ4eZNaxvw4sMY8kFxtYak6se8qP+/u8SlVKQaATJ/pE+5XjXSw5eSsJN4J
 zfo7HTUIAOjEuTh8vlZGWGvq/kljQXljGrmG2p9OlvNujmw9qpN+zD29q6KlWog8H3j/
 HYiQ==
X-Gm-Message-State: AOAM533FmfJgjAoJi5k5IfE9PEf2fK9hrdn8wj3rFDG55zxWgGlkV3xd
 CpdlGu0sfFCd3FxBgBB/uAo=
X-Google-Smtp-Source: ABdhPJz4A6PvsLwR7NWVxil/RjyK2z20P5LZxN0jA2yOivUfhD70vP66o2y60UIy6zpGgrkldTwZwA==
X-Received: by 2002:a17:907:a42b:: with SMTP id
 sg43mr11025344ejc.717.1640519020982; 
 Sun, 26 Dec 2021 03:43:40 -0800 (PST)
Received: from [172.16.30.20] ([91.135.9.67])
 by smtp.gmail.com with ESMTPSA id 12sm4141673eja.187.2021.12.26.03.43.40
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 26 Dec 2021 03:43:40 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.7\))
Subject: [RESEND] Amlogic DPCM audio card(s) speaker placement issue
Message-Id: <ECC56215-1E02-4735-82F3-B68E73F56CB4@gmail.com>
Date: Sun, 26 Dec 2021 11:43:39 +0000
Cc: Matthias Reichl <hias@horus.com>, Jerome Brunet <jbrunet@baylibre.com>,
 linux-amlogic@lists.infradead.org
To: alsa-devel@alsa-project.org
X-Mailer: Apple Mail (2.3608.120.23.2.7)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211226_034346_282525_FCDF457C 
X-CRM114-Status: UNSURE (   8.60  )
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

SGVsbG8gYWxzYS1kZXYgcGVvcGxlLAoKSeKAmWQgbGlrZSB0byBkZXNjcmliZSBhIHByb2JsZW0g
d2l0aCBzcGVha2VyIHBsYWNlbWVudCBzZWVuIHdpdGggdGhlIEFtbG9naWMKKG1lc29uKSBBSVUg
YW5kIEFYRyBkcml2ZXJzIHdoZW4gcGxheWluZyBtdWx0aS1jaGFubmVsIG1lZGlhLiBUaGUgcHJv
YmxlbSAKd2FzIHRyYWNlZCB0byBhIGZhaWx1cmUgdG8gZ2V0IHRoZSBjaGFubmVsIG1hcCB2aWEg
c25kX3BjbV9nZXRfY2htYXAoKQphbmQgZnVydGhlciBhbmFseXNpcyBzaG93ZWQgdGhpcyBmYWls
ZWQgYmVjYXVzZSB0aGUgUENNIGNvbnRyb2xzIGFyZSBleHBvc2VkCm9uIGEgZGlmZmVyZW50IGRl
dmljZSB0aGFuIHRoZSBQQ00gc3RyZWFtLgoKZS5nLiBvbiBMaWJyZVRlY2ggTGVQb3RhdG8gd2l0
aCBEUENNIHJvdXRpbmcgY29uZmlndXJlZCBmb3IgSERNSSBvdXRwdXQsCnRoZSBodyBQQ00gaXMg
b24gdGhlIHNpbmdsZSBmcm9udGVuZCBkZXZpY2UgMCBidXQgdGhlIFBDTSBjb250cm9scyBhcmUK
b24gZGV2aWNlIDI6CgpMZVBvdGF0bzp+ICMgYXBsYXkgLWwKKioqKiBMaXN0IG9mIFBMQVlCQUNL
IEhhcmR3YXJlIERldmljZXMgKioqKgpjYXJkIDA6IExJQlJFVEVDSENDIFtMSUJSRVRFQ0gtQ0Nd
LCBkZXZpY2UgMDogZmUuZGFpLWxpbmstMCAoKikgW10KIFN1YmRldmljZXM6IDEvMQogU3ViZGV2
aWNlICMwOiBzdWJkZXZpY2UgIzAKCkxlUG90YXRvOn4gIyBhbWl4ZXIgY29udHJvbHMKbnVtaWQ9
MTksaWZhY2U9TUlYRVIsbmFtZT0nUENNIFBsYXliYWNrIFZvbHVtZScKbnVtaWQ9MTgsaWZhY2U9
TUlYRVIsbmFtZT0nQUNPREVDIExlZnQgREFDIFNlbCcKbnVtaWQ9NyxpZmFjZT1NSVhFUixuYW1l
PSdBQ09ERUMgTXV0ZSBSYW1wIFN3aXRjaCcKbnVtaWQ9MixpZmFjZT1NSVhFUixuYW1lPSdBQ09E
RUMgUGxheWJhY2sgQ2hhbm5lbCBNb2RlJwpudW1pZD0zLGlmYWNlPU1JWEVSLG5hbWU9J0FDT0RF
QyBQbGF5YmFjayBTd2l0Y2gnCm51bWlkPTQsaWZhY2U9TUlYRVIsbmFtZT0nQUNPREVDIFBsYXli
YWNrIFZvbHVtZScKbnVtaWQ9NSxpZmFjZT1NSVhFUixuYW1lPSdBQ09ERUMgUmFtcCBSYXRlJwpu
dW1pZD0xNyxpZmFjZT1NSVhFUixuYW1lPSdBQ09ERUMgUmlnaHQgREFDIFNlbCcKbnVtaWQ9OCxp
ZmFjZT1NSVhFUixuYW1lPSdBQ09ERUMgVW5tdXRlIFJhbXAgU3dpdGNoJwpudW1pZD02LGlmYWNl
PU1JWEVSLG5hbWU9J0FDT0RFQyBWb2x1bWUgUmFtcCBTd2l0Y2gnCm51bWlkPTEsaWZhY2U9TUlY
RVIsbmFtZT0nQUlVIEFDT0RFQyBJMlMgTGFuZSBTZWxlY3QnCm51bWlkPTE2LGlmYWNlPU1JWEVS
LG5hbWU9J0FJVSBBQ09ERUMgT1VUIEVOIFN3aXRjaCcKbnVtaWQ9MTUsaWZhY2U9TUlYRVIsbmFt
ZT0nQUlVIEFDT0RFQyBTUkMnCm51bWlkPTE0LGlmYWNlPU1JWEVSLG5hbWU9J0FJVSBIRE1JIENU
UkwgU1JDJwpudW1pZD0xMyxpZmFjZT1NSVhFUixuYW1lPSdBSVUgU1BESUYgU1JDIFNFTCcKbnVt
aWQ9MTIsaWZhY2U9UENNLG5hbWU9J0VMRCcsZGV2aWNlPTIKbnVtaWQ9MTEsaWZhY2U9UENNLG5h
bWU9J0lFQzk1OCBQbGF5YmFjayBEZWZhdWx0JyxkZXZpY2U9MgpudW1pZD0xMCxpZmFjZT1QQ00s
bmFtZT0nSUVDOTU4IFBsYXliYWNrIE1hc2snLGRldmljZT0yCm51bWlkPTksaWZhY2U9UENNLG5h
bWU9J1BsYXliYWNrIENoYW5uZWwgTWFwJyxkZXZpY2U9MgoKaHR0cHM6Ly9naXRodWIuY29tL3Rv
cnZhbGRzL2xpbnV4L2Jsb2IvbWFzdGVyL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNv
bi1neGwtczkwNXgtbGlicmV0ZWNoLWNjLmR0cyNMMTM2LUwxODgKCm9yIG9uIGEgV2V0ZWsgUGxh
eSAyOgoKV1AyOn4gIyBhcGxheSAtbAoqKioqIExpc3Qgb2YgUExBWUJBQ0sgSGFyZHdhcmUgRGV2
aWNlcyAqKioqCmNhcmQgMDogV0VURUtQTEFZMiBbV0VURUstUExBWTJdLCBkZXZpY2UgMDogZmUu
ZGFpLWxpbmstMCAoKikgW10KIFN1YmRldmljZXM6IDEvMQogU3ViZGV2aWNlICMwOiBzdWJkZXZp
Y2UgIzAKY2FyZCAwOiBXRVRFS1BMQVkyIFtXRVRFSy1QTEFZMl0sIGRldmljZSAxOiBmZS5kYWkt
bGluay0xICgqKSBbXQogU3ViZGV2aWNlczogMS8xCiBTdWJkZXZpY2UgIzA6IHN1YmRldmljZSAj
MAoKV1AyOn4gIyBhbWl4ZXIgY29udHJvbHMKbnVtaWQ9NyxpZmFjZT1NSVhFUixuYW1lPSdQQ00g
UGxheWJhY2sgVm9sdW1lJwpudW1pZD02LGlmYWNlPU1JWEVSLG5hbWU9J0FJVSBIRE1JIENUUkwg
U1JDJwpudW1pZD01LGlmYWNlPU1JWEVSLG5hbWU9J0FJVSBTUERJRiBTUkMgU0VMJwpudW1pZD00
LGlmYWNlPVBDTSxuYW1lPSdFTEQnLGRldmljZT00Cm51bWlkPTMsaWZhY2U9UENNLG5hbWU9J0lF
Qzk1OCBQbGF5YmFjayBEZWZhdWx0JyxkZXZpY2U9NApudW1pZD0yLGlmYWNlPVBDTSxuYW1lPSdJ
RUM5NTggUGxheWJhY2sgTWFzaycsZGV2aWNlPTQKbnVtaWQ9MSxpZmFjZT1QQ00sbmFtZT0nUGxh
eWJhY2sgQ2hhbm5lbCBNYXAnLGRldmljZT00CgpodHRwczovL2dpdGh1Yi5jb20vdG9ydmFsZHMv
bGludXgvYmxvYi9tYXN0ZXIvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLWd4YmIt
d2V0ZWstcGxheTIuZHRzI0w1MS1MOTcKCkl0IGxvb2tzIGxpa2UgdGhlIFBDTSBjb250cm9scyBv
ZiB0aGUgYmFja2VuZCBoZG1pLWNvZGVjIGFyZSBub3Qgcm91dGVkCnRocm91Z2ggdGhlIERQQ00g
ZHJpdmVyIHRoZSBzYW1lIHdheSBhcyBQQ00gc3RyZWFtcy4gV2UgZGlzY3Vzc2VkIHRoYXQKaXNz
dWUgd2l0aCBKZXJvbWUsIHRoZSBkcml2ZXIgYXV0aG9yLCBidXQgaXTigJlzIG5vdCBjbGVhciB3
aGljaCBiaXRzIHdlCmFyZSBtaXNzaW5nLiBpLmUuIGlmIGl0J3Mgc29tZXRoaW5nIEFTb0MgRFBD
TSBzaG91bGQgYmUgaGFuZGxpbmcgb3IgaWYKc29tZSBmdXJ0aGVyIHBsdW1iaW5nIGluIHRoZSBj
YXJkIGRyaXZlciBvciB1c2Vyc3BhY2UgaXMgbmVlZGVkPwoKQW55IGhpbnRzIGludG8gdGhlIHJp
Z2h0IGRpcmVjdGlvbiB3b3VsZCBiZSBoaWdobHkgYXBwcmVjaWF0ZWQhCgpDaHJpc3RpYW4KCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxv
Z2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
