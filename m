Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97ED6CA5FA6
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Sep 2026 16:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I7EMeohre+SbKK/dAZeyUci1D3XRLqT+T4lMAiQr2SQ=; b=Kz/rdWni49lqCh
	eNcuoQEZSCiXJ64WIXcrokspO4eghfJhlpcVl0EHXNonyZEiAXzuY8NVmssULz4mw/qvldUOeVz+/
	f8WaRs1jWf7JxBzuCW3Xq8zhOqq+PVybUOka6fjQDwOQmV1GeHG/UfjOE4Oze9Y8PwU1U1+qNjJNK
	bp41CKPwT7/rWMw44rLrQiEm3PNdQ1VCBJ/jTeGmv7AcRSO+66Jk/OLRj2ax5XE701NYblAA4/Zxt
	DWXExK5o9c95fJtZXcKPzGJfBImNZUziHTH/jZnG84EbCUqis7W349eee5bwzHdNc7ecWk1Asqf10
	yc6LyK712iXYIxRKoxBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBE7M-000000010Tg-3Wf3;
	Mon, 28 Sep 2026 16:22:16 +0000
Received: from mail-qk2-x0f.google.com ([2607:f8b0:4864:34::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBE7K-000000010ST-0JdR
	for linux-amlogic@lists.infradead.org;
	Mon, 28 Sep 2026 16:22:15 +0000
Received: by mail-qk2-x0f.google.com with SMTP id d75a77b69052e-532db7db0c6so29892171cf.2
        for <linux-amlogic@lists.infradead.org>; Mon, 28 Sep 2026 09:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brivo.com; s=google; t=1790612532; x=1791217332; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I9iZ745V3O9TQK90r+cmJTPJh5uGbsz3PptJMxIgYsU=;
        b=JLe9H98zqz4h5lu1R0p0SKu/mmI048sWkSQFkWdZIz0eYeCHWQqdNLIWvCbWKwF5HK
         ZI7aQ2vLXOviL69WWPqnEIdwoDtE39TNyU8ne28jjiw9+tEebHRg6JBdaxelW23/1Ujx
         nHcxJKcboSc9cm+5JYWG3Lsx7wg88GEsIaRi0Z58MB2adhTn04c4Mb44YRQSpL2Fx7JO
         MtOVn3Qy3EfZrrnpCXx2a7T8G03nimfr8W2yP1KGvo1Qlco+1E6eK1VfIsF+Axm4aPsS
         yDtCndT7kGiYS+Lqwhc3q+2ZFX/z7dk9N73+UZ6DKBrxaRsJt4YFXLTWqP6FZvCOf6N1
         2hjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790612532; x=1791217332;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I9iZ745V3O9TQK90r+cmJTPJh5uGbsz3PptJMxIgYsU=;
        b=g8gNMI8eMv+eSwJUn9iUEaEbvGROJsZoLtpUhPoXQesN/c9fPspCTZ7DDGTX7PmHet
         KQGq3Bl0qcQc1caPa7EL0HK+JD5L1vie9/kdIr9T61zfM/8kEUg+xQuJ5iWe+uUUNizs
         4SuwcYtAlG/BoBIzNRI9mwdEeolAKw5Phw4UEertl+MekoskynpjYzqCcD2tiZkg3Iz9
         PTKJNjeURYk1lHhvW08vDVab/YDYR5vJMQ5vCMc6PfOku5Z8YAaebBJFkoxSbPwwvK7+
         Y5pmJyZtdxV+YG2F6Q8lFJtiER3r4O3x6pa31lCoLTXyxl2kSeuPpBCYvRzhp5k469hS
         Zssw==
X-Forwarded-Encrypted: i=1; AKwUvBzpG3C+NtuduiUhT+x0o8JnBtG2iBnQvC7zrNVMbjHAxdI6WjQgRtYFCsPp/p611uqnRRuURQfSkqiB7APt@lists.infradead.org
X-Gm-Message-State: AFuF++k0JZgFdzJ3xvjzRLSz66jwjoDAH9wUnrU7nX9spzbH43Ay/BxL
	XVOPdD47gQnOnFGJJuDJkPFcbBVSLU1vkiNXM6hPBAxds/DiLrbwMpT6bt82yT2VrLUXLZp1Pah
	Id6/FlBVO3JT0DSvSqmvZFv6Zqn8alaQtnJYdaMtzJy+Lm6vU997Rzc5uPv3KvFxrNw==
X-Gm-Gg: AYBFou3VEwJQMGNCEanXrTN2OwMvFKHbMsC9KGkV8VVLiQ841F5XCECZj+piTvZvNaB
	/ctsmoogD2Kb8QGwngzRyajk38hJfzBwROOZUnDBurJdjMJbmqmTYBD62bUYuv06a21hRpP6RTs
	kekP7bckoBujCuNKv1QWcqqm+6FMZ6AhA8VazxRvJwqpwdgQ5pqIH9X8d56vp9EEZjNshRQxqiQ
	vnpLAbpzFa7PjkluGOpWTrhDZY9sCinVgCkZtrvZYmkLfTPGkXDDWJI+AEzmpA75vCQN3y+4nwc
	B6QT/wwreJ0ZB7DaEDtNlJCGCnnXN92VgHCiE994ghpndhuGdANd90q0yi4QVXbeNK5W77NRkJo
	KSMzWyiadKIfaL3FBwA84GLfgvWgBuqEm/VO71CqLJQ5ZhNeZHsLz8ECpCWAqrYxeaoOpcGLOQY
	+OV/Zy+nIkCMdkp6DzPtMUMOm/G7QEhx3wtxI9uR/Cnz9cy/byrYJwHbQZ+o15BRG7aadQqskaG
	gM=
X-Received: by 2002:ac8:5c8d:0:b0:533:33c6:e63c with SMTP id d75a77b69052e-53333c6fec4mr122429221cf.16.1790612531895;
        Mon, 28 Sep 2026 09:22:11 -0700 (PDT)
Received: from [10.200.233.210] ([66.193.28.125])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-533223cad4esm65860381cf.24.2026.09.28.09.22.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 09:22:11 -0700 (PDT)
Message-ID: <e5a5dccc-46c4-497c-ab8b-b3f7fe5e316d@brivo.com>
Date: Mon, 28 Sep 2026 12:22:11 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mmc: meson-gx: Convert host->lock to raw spinlock
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: Ulf Hansson <ulfh@kernel.org>, linux-mmc@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Heiner Kallweit <hkallweit1@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org
References: <20260921191326.2146363-1-sanderson@brivo.com>
 <CAPx+jO8g-y+uc4YXUeZ3yOH6s44WFpytNu3-f6iLSjtHAVPd+A@mail.gmail.com>
Content-Language: en-US
From: Sean Anderson <sanderson@brivo.com>
In-Reply-To: <CAPx+jO8g-y+uc4YXUeZ3yOH6s44WFpytNu3-f6iLSjtHAVPd+A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_092214_115326_D99B1B0F 
X-CRM114-Status: GOOD (  17.35  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

CgpPbiA5LzI4LzI2IDEyOjE3IFBNLCBVbGYgSGFuc3NvbiB3cm90ZToKPiBPbiBNb24sIFNlcCAy
MSwgMjAyNiBhdCA5OjE04oCvUE0gU2VhbiBBbmRlcnNvbiA8c2FuZGVyc29uQGJyaXZvLmNvbT4g
d3JvdGU6Cj4+Cj4+IFRoZSBwcmltYXJ5IGhhbmRsZXIgZm9yIElSUUZfT05FU0hPVCBpbnRlcnJ1
cHRzIGlzIGFsd2F5cyBydW4gd2l0aG91dAo+PiB0aHJlYWRpbmcsIGV2ZW4gb24gUFJFRU1QVF9S
VC4gVGhlcmVmb3JlLCB3ZSBtdXN0IHVzZSBhIHJhdyBzcGlubG9jaywKPj4gd2hpY2ggd2lsbCBu
ZXZlciBzbGVlcCAoZXZlbiBvbiBQUkVFTVBUX1JUKS4KPiAKPiBTb3JyeSwgYnV0IEkgZG9uJ3Qg
cXVpdGUgdW5kZXJzdGFuZCB0aGUgYWJvdmUuIEFyZSB5b3Ugc2F5aW5nIHRoYXQKPiBJUlFGX09O
RVNIT1Qgb25seSB3b3JrcyB3aXRoIHJhdyBzcGlubG9ja3M/CgpUaGUgcHJpbWFyeSBoYW5kbGVy
IG9mIGFuIElSUUZfT05FU0hPVCBoYW5kbGVyIG11c3QgdXNlIHJhdyBzcGlubG9ja3MuCgpodHRw
czovL3d3dy5rZXJuZWwub3JnL2RvYy9odG1sL2xhdGVzdC9jb3JlLWFwaS9yZWFsLXRpbWUvZGlm
ZmVyZW5jZXMuaHRtbCNpbnRlcnJ1cHQtaGFuZGxpbmcKCj4gCj4+Cj4+IEZpeGVzOiAwNjZlY2Rl
NmQ4MjYgKCJtbWM6IG1lc29uLWd4OiBhZGQgU0RJTyBpbnRlcnJ1cHQgc3VwcG9ydCIpCj4+IFNp
Z25lZC1vZmYtYnk6IFNlYW4gQW5kZXJzb24gPHNhbmRlcnNvbkBicml2by5jb20+Cj4+IC0tLQo+
Pgo+PiAgIGRyaXZlcnMvbW1jL2hvc3QvbWVzb24tZ3gtbW1jLmMgfCAxMiArKysrKystLS0tLS0K
Pj4gICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQo+Pgo+
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tbWMvaG9zdC9tZXNvbi1neC1tbWMuYyBiL2RyaXZlcnMv
bW1jL2hvc3QvbWVzb24tZ3gtbW1jLmMKPj4gaW5kZXggNjk0YmI0NDNkNWYzZi4uZDUzNjVjMDQw
NGNiOSAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9tbWMvaG9zdC9tZXNvbi1neC1tbWMuYwo+PiAr
KysgYi9kcml2ZXJzL21tYy9ob3N0L21lc29uLWd4LW1tYy5jCj4+IEBAIC0xNzYsNyArMTc2LDcg
QEAgc3RydWN0IG1lc29uX2hvc3Qgewo+Pgo+PiAgICAgICAgICBib29sIG5lZWRzX3ByZV9wb3N0
X3JlcTsKPj4KPj4gLSAgICAgICBzcGlubG9ja190IGxvY2s7Cj4+ICsgICAgICAgcmF3X3NwaW5s
b2NrX3QgbG9jazsKPj4gICB9Owo+Pgo+PiAgICNkZWZpbmUgQ01EX0NGR19MRU5HVEhfTUFTSyBH
RU5NQVNLKDgsIDApCj4+IEBAIC05NTMsMTAgKzk1MywxMCBAQCBzdGF0aWMgaXJxcmV0dXJuX3Qg
bWVzb25fbW1jX2lycShpbnQgaXJxLCB2b2lkICpkZXZfaWQpCj4+ICAgICAgICAgIGNtZCA9IGhv
c3QtPmNtZDsKPj4KPj4gICAgICAgICAgaWYgKHN0YXR1cyAmIElSUV9TRElPKSB7Cj4+IC0gICAg
ICAgICAgICAgICBzcGluX2xvY2soJmhvc3QtPmxvY2spOwo+PiArICAgICAgICAgICAgICAgcmF3
X3NwaW5fbG9jaygmaG9zdC0+bG9jayk7Cj4+ICAgICAgICAgICAgICAgICAgX19tZXNvbl9tbWNf
ZW5hYmxlX3NkaW9faXJxKGhvc3QtPm1tYywgMCk7Cj4+ICAgICAgICAgICAgICAgICAgc2Rpb19z
aWduYWxfaXJxKGhvc3QtPm1tYyk7Cj4+IC0gICAgICAgICAgICAgICBzcGluX3VubG9jaygmaG9z
dC0+bG9jayk7Cj4+ICsgICAgICAgICAgICAgICByYXdfc3Bpbl91bmxvY2soJmhvc3QtPmxvY2sp
Owo+PiAgICAgICAgICAgICAgICAgIHN0YXR1cyAmPSB+SVJRX1NESU87Cj4+ICAgICAgICAgICAg
ICAgICAgaWYgKCFzdGF0dXMpCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gSVJR
X0hBTkRMRUQ7Cj4+IEBAIC0xMTEyLDkgKzExMTIsOSBAQCBzdGF0aWMgdm9pZCBtZXNvbl9tbWNf
ZW5hYmxlX3NkaW9faXJxKHN0cnVjdCBtbWNfaG9zdCAqbW1jLCBpbnQgZW5hYmxlKQo+PiAgICAg
ICAgICBzdHJ1Y3QgbWVzb25faG9zdCAqaG9zdCA9IG1tY19wcml2KG1tYyk7Cj4+ICAgICAgICAg
IHVuc2lnbmVkIGxvbmcgZmxhZ3M7Cj4+Cj4+IC0gICAgICAgc3Bpbl9sb2NrX2lycXNhdmUoJmhv
c3QtPmxvY2ssIGZsYWdzKTsKPj4gKyAgICAgICByYXdfc3Bpbl9sb2NrX2lycXNhdmUoJmhvc3Qt
PmxvY2ssIGZsYWdzKTsKPj4gICAgICAgICAgX19tZXNvbl9tbWNfZW5hYmxlX3NkaW9faXJxKG1t
YywgZW5hYmxlKTsKPj4gLSAgICAgICBzcGluX3VubG9ja19pcnFyZXN0b3JlKCZob3N0LT5sb2Nr
LCBmbGFncyk7Cj4+ICsgICAgICAgcmF3X3NwaW5fdW5sb2NrX2lycXJlc3RvcmUoJmhvc3QtPmxv
Y2ssIGZsYWdzKTsKPj4gICB9Cj4+Cj4+ICAgc3RhdGljIHZvaWQgbWVzb25fbW1jX2Fja19zZGlv
X2lycShzdHJ1Y3QgbW1jX2hvc3QgKm1tYykKPj4gQEAgLTEyMjUsNyArMTIyNSw3IEBAIHN0YXRp
YyBpbnQgbWVzb25fbW1jX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4+ICAg
ICAgICAgIGlmIChyZXQpCj4+ICAgICAgICAgICAgICAgICAgZ290byBlcnJfaW5pdF9jbGs7Cj4+
Cj4+IC0gICAgICAgc3Bpbl9sb2NrX2luaXQoJmhvc3QtPmxvY2spOwo+PiArICAgICAgIHJhd19z
cGluX2xvY2tfaW5pdCgmaG9zdC0+bG9jayk7Cj4+Cj4+ICAgICAgICAgIGlmIChob3N0LT5kcmFt
X2FjY2Vzc19xdWlyaykgewo+PiAgICAgICAgICAgICAgICAgIC8qIExpbWl0IHNlZ21lbnRzIHRv
IDEgZHVlIHRvIGxvdyBhdmFpbGFibGUgc3JhbSBtZW1vcnkgKi8KPj4gLS0tCj4+IGJhc2UtY29t
bWl0OiA1ODc4NTgzNjc1ODFiOWM1NWMzNjkwZjRlNjMzODJhZDYyMjcxOWQ0Cj4+IGJyYW5jaDog
bWVzb25fbW1jX3Jhdwo+Pgo+PiAtLQo+PiAyLjUzLjAKPj4KCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdAps
aW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
