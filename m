Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B3D4C4828F
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Feb 2024 14:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xcsZTvX+H2zdsnUFqvMtbdPxcwyEdUAobX2DkRq+22M=; b=AYy7nGp3n6KPIs
	wx09InU5yHqa19+1Icz9zhT6UV6NLDPEnBA7mNo+Ly/d9q7e7yhcS5RL9B9I8jVUtpLqSgHas/Ugv
	+3aBhSd1RmRUib7uvwyWWceB6oGH7c4JK6WK7Z/MxRfwmF+gXRBEqVB+yGI7G9OaHPS7+IoeHpnq7
	01N1cXhfFYoz1MWaKcaJuYccQci9F+bOG8vBfvF3GUfv1ytPQIVD2fW64KrawvNhK1dYuDQtcll6E
	G7F7RxHbtK+zl7b06VwWp1AZ05r4oXogb+t7qaR9SpPo36qmkIme9Ch5odOHX4RoFEiU5oh9jKs1A
	mkuIZEP4pUNeOlvojF5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rY5Ks-0000000E2Ei-1oTK;
	Thu, 08 Feb 2024 14:25:06 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rY5Kp-0000000E2CR-2kBM;
	Thu, 08 Feb 2024 14:25:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 882E0CE1B1A;
	Thu,  8 Feb 2024 14:25:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9097C433F1;
	Thu,  8 Feb 2024 14:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707402300;
	bh=k9PWzREXb25IgI5xrvjYbQ9AfDmYYoThZ4v7NnxSkE4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=HKN5UCsyzQDmfnSVUA0PWCr4yMUZNi+1lTyc0JbjjTsQb2UcMIusw04kON04kkTgZ
	 948z61i3hmXjbIWe8qSO9l5wG+h4glMKC6+BdVXxonSILXp24tafqTww0GCcZls3My
	 OZq1GfqXgkhPAyRS/lapHkeu6oBhtg6G3IzH3mCW+9fxtCcEuzyNEg+vEYRa5/UZGw
	 RH/0aEs1OHbGsGpaP/c0pLiCYssn7lBmC5gh5HZ5o3QiIAfiUOLNgpWG0nG7JTdJcU
	 xs4rgdJmjlkdIITupdx5kNo9x1RpgvYkBn0F5KTUejtILWmz01+JbrkwC/0rdq6+bZ
	 PQYII4pWOpX/Q==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org, wens@csie.org, marek.vasut+renesas@gmail.com, 
 support.opensource@diasemi.com, neil.armstrong@linaro.org, 
 ckeepax@opensource.cirrus.com, rf@opensource.cirrus.com, 
 mazziesaccount@gmail.com, mcoquelin.stm32@gmail.com, 
 alexandre.torgue@foss.st.com, Bo Liu <liubo03@inspur.com>
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, patches@opensource.cirrus.com, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20240206071314.8721-1-liubo03@inspur.com>
References: <20240206071314.8721-1-liubo03@inspur.com>
Subject: Re: [PATCH 00/18] mfd: convert to use maple tree register cache
Message-Id: <170740229742.1068783.15434523911244194304.b4-ty@kernel.org>
Date: Thu, 08 Feb 2024 14:24:57 +0000
MIME-Version: 1.0
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240208_062504_088362_B45CA439 
X-CRM114-Status: UNSURE (   6.74  )
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

T24gVHVlLCAwNiBGZWIgMjAyNCAwMjoxMjo1NiAtMDUwMCwgQm8gTGl1IHdyb3RlOgo+IFRoZSBt
YXBsZSB0cmVlIHJlZ2lzdGVyIGNhY2hlIGlzIGJhc2VkIG9uIGEgbXVjaCBtb3JlIG1vZGVybiBk
YXRhIHN0cnVjdHVyZQo+IHRoYW4gdGhlIHJidHJlZSBjYWNoZSBhbmQgbWFrZXMgb3B0aW1pc2F0
aW9uIGNob2ljZXMgd2hpY2ggYXJlIHByb2JhYmx5Cj4gbW9yZSBhcHByb3ByaWF0ZSBmb3IgbW9k
ZXJuIHN5c3RlbXMgdGhhbiB0aG9zZSBtYWRlIGJ5IHRoZSByYnRyZWUgY2FjaGUuCj4gCj4gQm8g
TGl1ICgxOCk6Cj4gICBtZmQ6IGFjMTAwOiBjb252ZXJ0IHRvIHVzZSBtYXBsZSB0cmVlIHJlZ2lz
dGVyIGNhY2hlCj4gICBtZmQ6IGFzMzcxMTogY29udmVydCB0byB1c2UgbWFwbGUgdHJlZSByZWdp
c3RlciBjYWNoZQo+ICAgbWZkOiBhczM3MjI6IGNvbnZlcnQgdG8gdXNlIG1hcGxlIHRyZWUgcmVn
aXN0ZXIgY2FjaGUKPiAgIG1mZDogYXhwMjB4OiBjb252ZXJ0IHRvIHVzZSBtYXBsZSB0cmVlIHJl
Z2lzdGVyIGNhY2hlCj4gICBtZmQ6IGJjbTU5MHh4OiBjb252ZXJ0IHRvIHVzZSBtYXBsZSB0cmVl
IHJlZ2lzdGVyIGNhY2hlCj4gICBtZmQ6IGJkOTU3MW13djogY29udmVydCB0byB1c2UgbWFwbGUg
dHJlZSByZWdpc3RlciBjYWNoZQo+ICAgbWZkOiBkaWFsb2c6IGNvbnZlcnQgdG8gdXNlIG1hcGxl
IHRyZWUgcmVnaXN0ZXIgY2FjaGUKPiAgIG1mZDoga2hhZGFzLW1jdTogY29udmVydCB0byB1c2Ug
bWFwbGUgdHJlZSByZWdpc3RlciBjYWNoZQo+ICAgbWZkOiBsb2NobmFnYXItaTJjOiBjb252ZXJ0
IHRvIHVzZSBtYXBsZSB0cmVlIHJlZ2lzdGVyIGNhY2hlCj4gICBtZmQ6IHdvbGZzb246IGNvbnZl
cnQgdG8gdXNlIG1hcGxlIHRyZWUgcmVnaXN0ZXIgY2FjaGUKPiAgIG1mZDogcm9obTogY29udmVy
dCB0byB1c2UgbWFwbGUgdHJlZSByZWdpc3RlciBjYWNoZQo+ICAgbWZkOiByazh4eDogY29udmVy
dCB0byB1c2UgbWFwbGUgdHJlZSByZWdpc3RlciBjYWNoZQo+ICAgbWZkOiBybjV0NjE4OiBjb252
ZXJ0IHRvIHVzZSBtYXBsZSB0cmVlIHJlZ2lzdGVyIGNhY2hlCj4gICBtZmQ6IHJzbXVfaTJjOiBj
b252ZXJ0IHRvIHVzZSBtYXBsZSB0cmVlIHJlZ2lzdGVyIGNhY2hlCj4gICBtZmQ6IHNpNDc2eDog
Y29udmVydCB0byB1c2UgbWFwbGUgdHJlZSByZWdpc3RlciBjYWNoZQo+ICAgbWZkOiBzdG1meDog
Y29udmVydCB0byB1c2UgbWFwbGUgdHJlZSByZWdpc3RlciBjYWNoZQo+ICAgbWZkOiBzdHBtaWMx
OiBjb252ZXJ0IHRvIHVzZSBtYXBsZSB0cmVlIHJlZ2lzdGVyIGNhY2hlCj4gICBtZmQ6IHJjNXQ1
ODM6IGNvbnZlcnQgdG8gdXNlIG1hcGxlIHRyZWUgcmVnaXN0ZXIgY2FjaGUKPiAKPiBbLi4uXQoK
QXBwbGllZCwgdGhhbmtzIQoKWzAxLzE4XSBtZmQ6IGFjMTAwOiBjb252ZXJ0IHRvIHVzZSBtYXBs
ZSB0cmVlIHJlZ2lzdGVyIGNhY2hlCiAgICAgICAgY29tbWl0OiA4NzQ1YTgxYWMyMmY0MmM3MjMz
ZmJkZGM2YWE1OTIyYjIzMWFhYzJhClswMi8xOF0gbWZkOiBhczM3MTE6IGNvbnZlcnQgdG8gdXNl
IG1hcGxlIHRyZWUgcmVnaXN0ZXIgY2FjaGUKICAgICAgICBjb21taXQ6IDc4MGIxYWE0NDFhM2Q2
NGU0MDBjYjJlYTk2YmMzZTE2MjMyMmViMzEKWzAzLzE4XSBtZmQ6IGFzMzcyMjogY29udmVydCB0
byB1c2UgbWFwbGUgdHJlZSByZWdpc3RlciBjYWNoZQogICAgICAgIGNvbW1pdDogYWVhNWMzY2Jj
NTFlZWUzYWMyNWZmOGY5MzYyNTI5MDFjNDU0OTAxMQpbMDQvMThdIG1mZDogYXhwMjB4OiBjb252
ZXJ0IHRvIHVzZSBtYXBsZSB0cmVlIHJlZ2lzdGVyIGNhY2hlCiAgICAgICAgY29tbWl0OiAwMDkw
NzNkNTA0ZjY3MTQ2ZDkzNmNjNDVmMjFjYzI3YzFiYzE1NDkwClswNS8xOF0gbWZkOiBiY201OTB4
eDogY29udmVydCB0byB1c2UgbWFwbGUgdHJlZSByZWdpc3RlciBjYWNoZQogICAgICAgIGNvbW1p
dDogNjg0YzFmMGI3OTQxN2NmMDg4MTBkZmQ1N2M1YTU0OWE5NzQxYWQ3YQpbMDYvMThdIG1mZDog
YmQ5NTcxbXd2OiBjb252ZXJ0IHRvIHVzZSBtYXBsZSB0cmVlIHJlZ2lzdGVyIGNhY2hlCiAgICAg
ICAgY29tbWl0OiAzNWIxYjg2MjJjYTMxNzJiM2M2YjJhMzc3ZTU5MTNiYWMwMzY3NjM0ClswNy8x
OF0gbWZkOiBkaWFsb2c6IGNvbnZlcnQgdG8gdXNlIG1hcGxlIHRyZWUgcmVnaXN0ZXIgY2FjaGUK
ICAgICAgICBjb21taXQ6IDFjYjdhM2JjYTU2YzEyNGNhOWU1YzEzZmNhYzdkZTg4NGMxOTVjNWMK
WzA4LzE4XSBtZmQ6IGtoYWRhcy1tY3U6IGNvbnZlcnQgdG8gdXNlIG1hcGxlIHRyZWUgcmVnaXN0
ZXIgY2FjaGUKICAgICAgICBjb21taXQ6IDVmNzM0ZjVmMzc0ZjY4OTYwYWZkMjEzMGE1Y2U5ODI5
MTJjMTRjMTUKWzA5LzE4XSBtZmQ6IGxvY2huYWdhci1pMmM6IGNvbnZlcnQgdG8gdXNlIG1hcGxl
IHRyZWUgcmVnaXN0ZXIgY2FjaGUKICAgICAgICBjb21taXQ6IDg4ODE4OTZlMDViNmE5MTI1MWRk
ZTBjZTIxY2U3OWMyYzIwMTg4OGQKWzEwLzE4XSBtZmQ6IHdvbGZzb246IGNvbnZlcnQgdG8gdXNl
IG1hcGxlIHRyZWUgcmVnaXN0ZXIgY2FjaGUKICAgICAgICBjb21taXQ6IGYzNTNiMmM2MzllNGY0
YWM5ODMxZDk0YzgyMzcwMjZjZWJhYThlNzMKWzExLzE4XSBtZmQ6IHJvaG06IGNvbnZlcnQgdG8g
dXNlIG1hcGxlIHRyZWUgcmVnaXN0ZXIgY2FjaGUKICAgICAgICBjb21taXQ6IGFhYmQzOGYzNzc5
YjgxMDhiNjVjYzdhZThiNWMyMGE2YzM1MmIwYTIKWzEyLzE4XSBtZmQ6IHJrOHh4OiBjb252ZXJ0
IHRvIHVzZSBtYXBsZSB0cmVlIHJlZ2lzdGVyIGNhY2hlCiAgICAgICAgY29tbWl0OiAwOGFhMWU3
OTdhNWNjOTdkMjEwNjQ3NjI2M2Y5MzgzNDJlNzIwMTVlClsxMy8xOF0gbWZkOiBybjV0NjE4OiBj
b252ZXJ0IHRvIHVzZSBtYXBsZSB0cmVlIHJlZ2lzdGVyIGNhY2hlCiAgICAgICAgY29tbWl0OiBh
MDExY2FjYjYzYzNmZjY1NjJiZDg2YWZhZThjZGQ0OWQwZjA3NWM5ClsxNC8xOF0gbWZkOiByc211
X2kyYzogY29udmVydCB0byB1c2UgbWFwbGUgdHJlZSByZWdpc3RlciBjYWNoZQogICAgICAgIGNv
bW1pdDogYjg1ODIxY2VjZGY5MzM0MjBhNmJhOTM2NThlMWU0NzEwNjQ0ZjVjMQpbMTUvMThdIG1m
ZDogc2k0NzZ4OiBjb252ZXJ0IHRvIHVzZSBtYXBsZSB0cmVlIHJlZ2lzdGVyIGNhY2hlCiAgICAg
ICAgY29tbWl0OiAwMzA0NzM4NzFjM2Y0ZjEyNmJkNDMwMTg1MTdhYmZjYjA3MGY2Yjk1ClsxNi8x
OF0gbWZkOiBzdG1meDogY29udmVydCB0byB1c2UgbWFwbGUgdHJlZSByZWdpc3RlciBjYWNoZQog
ICAgICAgIGNvbW1pdDogODdhNDhlMzVjZTJlZjk5MjI4N2I4MjhiMTI2OGJlZGM3NDE1ZDJkZQpb
MTcvMThdIG1mZDogc3RwbWljMTogY29udmVydCB0byB1c2UgbWFwbGUgdHJlZSByZWdpc3RlciBj
YWNoZQogICAgICAgIGNvbW1pdDogYWI5OTNkMmQ2ODk1MWRiM2ViZmVhYTQ0NTY3YTc5MGVjNTY2
NTI2ZApbMTgvMThdIG1mZDogcmM1dDU4MzogY29udmVydCB0byB1c2UgbWFwbGUgdHJlZSByZWdp
c3RlciBjYWNoZQogICAgICAgIGNvbW1pdDogZDUxMzJkMTc2ZDZmMjE3NDJhYzY3ZmQzMTFjY2M2
MWZlODMwZTk5OQoKLS0KTGVlIEpvbmVzIFvmnY7nkLzmlq9dCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QK
bGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
