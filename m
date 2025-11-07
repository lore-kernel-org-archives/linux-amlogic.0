Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2377CCCFA05
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Nov 2025 17:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fqOLapTVBjHxvNj2rIzF16f28X38o2LkE6buoN6FXZ0=; b=AZLPQnuUHmVI3W
	8pURyD7OhX4X+BRMHeRw/s+zO27jy+bGKjOjNhfGUlfT5Ieh4hnpUdlGRhnAyeO7r+5K2t9XfiRp2
	TqY5NGYcVn3GdW9P6CkTV1ZAjGQNpUkoE8nBH2CoKbb3Bp3FDQnGeIy18sffgEYNBkmXoospRAMfN
	MgBdjdZT8uEgUBvysjuaUkaE1gJA2SG0Q+NliZ9qPggX7kcHVgnvx5JPgR7/f9m0l6FB4s/UQjLGE
	mKdoiDlc1cF/eqIeKvp726KvV8sFLMMI5d91yVXcyF3+gOH0vGWb7ZGrOmLCgPEcGJPFH8Zhx+NNr
	aGQqrGtSnIL/a/SwrdZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHPyp-00000000CGA-28dL;
	Fri, 07 Nov 2025 17:10:31 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHPyl-00000000CE5-2NWh
	for linux-amlogic@lists.infradead.org;
	Fri, 07 Nov 2025 17:10:29 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4710665e7deso4776055e9.1
        for <linux-amlogic@lists.infradead.org>; Fri, 07 Nov 2025 09:10:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1762535425; x=1763140225; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d75/m8OyEpl0fwQUB+HUMKmdvA/o/D0pvjuoB/XRU0Q=;
        b=1lvGAYSixOV64cmZt9H6QgTmHobVoqVsu+5UrAw66H57BY67HYzUdoo/sEYMwqruVU
         701QQOwhQOZKOBKrQ771xsJCJAWbZcl6a1/SyWd48G7YTDsmywGCznygFivHEBHMlBHP
         GVYaMVCd/tM35V8af2TcaMeUVu6mz4iXDf5Tt+Lxzyg+1NMLQmK5V6dJfFayKDb0ASUs
         IP4+0z9zmNo5waMR9o6nZPYw9r6WIA8NkBKaxdCLhXouhT+UOT9iVaAeYJtjWFB6SW2O
         Fz2S6Rt+sjKFYGZJIxEfjuRAjOoS8LZutoLOAmLFKb76Ia/rMpZ/qXOi8IR6yXIqYfE0
         EV9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762535425; x=1763140225;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d75/m8OyEpl0fwQUB+HUMKmdvA/o/D0pvjuoB/XRU0Q=;
        b=lLD3uR00XqhFvCyYEBFBloZDB/GNwlaAqJjPzrSEqFKYyLvXrRVp4bgJweeRxXzmff
         Q+I6jGOU4a6Tol/XFBUFl7kCbb67aKDVjtca8UYMjdAQ/kqr/fUr4ybWUhsvPRjdW254
         +zMFujE86lAf+iT973FuaJi7VUsntNL5DtYGCxsQwFmmfdZw+QXIjuk87lPU1xdfRX3v
         5KiaAuSab6TRbleWW9u6HPt/6UGpmszCSxZ36Zo3hxyLHGTG3sxTjbrdvt4pfCqi0YBJ
         K2KDA08B8nLUuZZvLPimIU93wIXcOoyJuadrlnRIDM/qW5hiR0l/TchPc+K4LgCNrd8a
         Gc+Q==
X-Forwarded-Encrypted: i=1; AJvYcCU3S1279gJaJr0ZzM0XPQMF44VbZAzPcc+rW2xtn98vDccPM5RM3eSVtepZvamWIe+1OuUJ+4yVmFEcoWqq@lists.infradead.org
X-Gm-Message-State: AOJu0YzjdhASQgaeRdXhkEzlOz+S8ihKyBa8QmRHuCrIdF1u69nFaI3N
	dWuOl+i7v6dE18MDEdy6Ro4/6DX3tg2ksKfVok09x4m3Q/mrBnjX8Tma4o0xlbiOgNs=
X-Gm-Gg: ASbGncva/fGUBq3N+AZDOYHY69kbsy4UmkugUgsTuYAO5dI6DBv9hmIO9CVwbEcPnlT
	zH5UzusL7w6duO1QDsOOHguYsBRXF4BXYZBCoxYTgMx4HjEV+T2AhSMZb+TV6/NKqvIJw0R2qwU
	JmF1Agsu6VHHSdK2Zo9IgLSLIif2YY/fqRPYiY0YHN1BbQuINExEFyIU6D4+WQRIsKERXekZCD0
	u83R+AusQkuWhf/XOi8b87GjrwzM24m4H32pud4to08ecl0XBtLpqlrWIBnDv5mFV0Xw6m4nin+
	sa+/ewcaVtAyB1lZ7508WawucMI4HTGwZ4AMS0F/y9SycOb4SEOTGeKr1le36ElOZ2UzIbfl7//
	pFX2HjsW74XAdWr1cB9y2skwq6N2kzXgz8mdMC4koDNMcPwHpL64AQLYmYTMhUIa136kkuIN5X+
	umaJuiNHFh
X-Google-Smtp-Source: AGHT+IHs0fGLj1pX9D20cd+qxJYOXVpz1DkRCoiP+yxFDAzBqmLvwRgTWCnCmwGVOrewtrpdAZ4qhA==
X-Received: by 2002:a05:600c:4ed4:b0:471:786:94d3 with SMTP id 5b1f17b1804b1-4776bcd52bamr34376015e9.22.1762535424637;
        Fri, 07 Nov 2025 09:10:24 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:d88d:7650:f1de:19c])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4776bcfd021sm78745585e9.11.2025.11.07.09.10.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 09:10:24 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jian Hu <jian.hu@amlogic.com>
Cc: Xianwei Zhao <xianwei.zhao@amlogic.com>,  Chuan Liu
 <chuan.liu@amlogic.com>,  Neil Armstrong <neil.armstrong@linaro.org>,
  Kevin Hilman <khilman@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,
  Michael Turquette <mturquette@baylibre.com>,  Dmitry Rokosov
 <ddrokosov@sberdevices.ru>,  robh+dt <robh+dt@kernel.org>,  Rob Herring
 <robh@kernel.org>,  devicetree <devicetree@vger.kernel.org>,  linux-clk
 <linux-clk@vger.kernel.org>,  linux-amlogic
 <linux-amlogic@lists.infradead.org>,  linux-kernel
 <linux-kernel@vger.kernel.org>,  linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v4 5/5] clk: meson: t7: add t7 clock peripherals
 controller driver
In-Reply-To: <236a568d-c809-4dc7-be2f-e813d0d85368@amlogic.com> (Jian Hu's
	message of "Sat, 8 Nov 2025 00:20:33 +0800")
References: <20251030094345.2571222-1-jian.hu@amlogic.com>
	<20251030094345.2571222-6-jian.hu@amlogic.com>
	<1jbjlnxuug.fsf@starbuckisacylon.baylibre.com>
	<3b9a5978-aa02-486b-85f5-6443dc607dd5@amlogic.com>
	<1j1pmew1cu.fsf@starbuckisacylon.baylibre.com>
	<236a568d-c809-4dc7-be2f-e813d0d85368@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Fri, 07 Nov 2025 18:10:23 +0100
Message-ID: <1jv7jlvke8.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_091027_631183_52B42611 
X-CRM114-Status: GOOD (  20.67  )
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

T24gU2F0IDA4IE5vdiAyMDI1IGF0IDAwOjIwLCBKaWFuIEh1IDxqaWFuLmh1QGFtbG9naWMuY29t
PiB3cm90ZToKCj4gT24gMTEvNC8yMDI1IDY6MTQgUE0sIEplcm9tZSBCcnVuZXQgd3JvdGU6Cj4+
IFsgRVhURVJOQUwgRU1BSUwgXQo+Pgo+PiBPbiBUdWUgMDQgTm92IDIwMjUgYXQgMTc6MTcsIEpp
YW4gSHUgPGppYW4uaHVAYW1sb2dpYy5jb20+IHdyb3RlOgo+Pgo+Pj4+PiArCj4+Pj4+ICtzdGF0
aWMgc3RydWN0IGNsa19yZWdtYXAgdDdfZHNwYSA9IHsKPj4+Pj4gKyAgICAgLmRhdGEgPSAmKHN0
cnVjdCBjbGtfcmVnbWFwX211eF9kYXRhKXsKPj4+Pj4gKyAgICAgICAgICAgICAub2Zmc2V0ID0g
RFNQQV9DTEtfQ1RSTDAsCj4+Pj4+ICsgICAgICAgICAgICAgLm1hc2sgPSAweDEsCj4+Pj4+ICsg
ICAgICAgICAgICAgLnNoaWZ0ID0gMTUsCj4+Pj4+ICsgICAgIH0sCj4+Pj4+ICsgICAgIC5ody5p
bml0ID0gJihzdHJ1Y3QgY2xrX2luaXRfZGF0YSl7Cj4+Pj4+ICsgICAgICAgICAgICAgLm5hbWUg
PSAiZHNwYSIsCj4+Pj4+ICsgICAgICAgICAgICAgLm9wcyA9ICZjbGtfcmVnbWFwX211eF9vcHMs
Cj4+Pj4+ICsgICAgICAgICAgICAgLnBhcmVudF9od3MgPSAoY29uc3Qgc3RydWN0IGNsa19odyAq
W10pIHsKPj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICZ0N19kc3BhX2EuaHcsCj4+Pj4+ICsg
ICAgICAgICAgICAgICAgICAgICAmdDdfZHNwYV9iLmh3LAo+Pj4+PiArICAgICAgICAgICAgIH0s
Cj4+Pj4+ICsgICAgICAgICAgICAgLm51bV9wYXJlbnRzID0gMiwKPj4+Pj4gKyAgICAgICAgICAg
ICAuZmxhZ3MgPSBDTEtfU0VUX1JBVEVfUEFSRU5ULAo+Pj4+PiArICAgICB9LAo+Pj4+PiArfTsK
Pj4+Pj4gKwo+Pj4+PiAuLi4uLi4KPj4+Pj4gKwo+Pj4+PiArc3RhdGljIHN0cnVjdCBjbGtfcmVn
bWFwIHQ3X2FuYWtpbl8wID0gewo+Pj4+IE5pdHBpY2s6IGZvciB0aGUgRFNQIGl0IHdhcyBhL2Is
IGhlcmUgaXQgaXMgMC8xCj4+Pj4gQ291bGQgeW91IHBpY2sgb25lIHdheSBvciB0aGUgb3RoZXIg
YW5kIHN0aWNrIHRvIGl0ID8KPj4+Cj4+PiBvayAsIEkgd2lsbCB1c2UgMC8xIGZvciBEU1AuCj4+
IEkgdGhpbmsgSSBwcmVmZXIgYS9iIGlmIHlvdSBkb24ndCBtaW5kLiBzZWUgYmVsb3cgZm9yIHdo
eSAuLi4KPgo+Cj4gTWFsaSBpcyBuYW1lZCBhcyBtYWxpXzAsIG1hbGlfMSBpbiB0aGlzIGRyaXZl
ci7CoCDCoEFuZCBHMTJBL1M0L0dYQkIgc2VyaWVzCj4gZG8gdGhlIHNhbWUuCgouLi4gQTEgdXNl
IGRzcGFfYSBkc3BhX2IgKGV0YyAuLi4pIAoKPgo+IElmIHRoZXkgYXJlIG5hbWVkIGFzIGFuYWtp
bl9hIGFuZCBhbmFraW5fYiBoZXJlLCB0aGVyZSB3aWxsIGJlIHR3byBuYW1pbmcKPiBtZXRob2Rz
Lgo+CgpBbHJlYWR5IGhhdmUgdGhhdCB1bmZvcnR1bmF0ZWx5Cgo+IFNoYWxsIHdlIGtlZXAgY29u
c2lzdGVudCA/Cj4KClBsZWFzZSB0cnkgeWVzCgo+Cj4gSWYgdXNlIDAvMSB0byBuYW1lIHRoZW0u
Cj4KPiBkc3AgY2xvY2tzIGFyZToKPgo+IMKgIMKgIGRzcGFfMF9zZWwKPgo+IMKgIMKgIGRzcGFf
MF9kaXYKPgo+IMKgIMKgIGRzcGFfMAo+Cj4gwqAgwqAgZHNwYV8xX3NlbAo+Cj4gwqAgwqAgZHNw
YV8xX2Rpdgo+Cj4gwqAgwqAgZHNwYV8xCj4KPiDCoCDCoCBkc3BiXzBfc2VsCj4KPiDCoCDCoCBk
c3BiXzBfZGl2Cj4KPiDCoCDCoCBkc3BiXzAKPgo+IMKgIMKgIGRzcGJfMV9zZWwKPgo+IMKgIMKg
IGRzcGJfMV9kaXYKPgo+IMKgIMKgIGRzcGJfMQo+Cj4KPiBhbmFraW4gY2xvY2tzIGFyZToKPgo+
IMKgIMKgIGFuYWtpbl8wX3NlbAo+Cj4gwqAgwqAgYW5ha2luXzBfZGl2Cj4KPiDCoCDCoCBhbmFr
aW5fMAo+Cj4gwqAgwqAgYW5ha2luXzFfc2VsCj4KPiDCoCDCoCBhbmFraW5fMV9kaXYKPgo+IMKg
IMKgIGFuYWtpbl8xCj4KPiDCoCDCoCBhbmFraW5fMDFfc2VsCj4KPiDCoCDCoCBhbmFraW4KPgo+
Cj4gSWYgdXNlIGEvYiB0byBuYW1lIHRoZW0uCj4KPiBkc3AgY2xvY2tzIGFyZToKPgo+IMKgIMKg
IGRzcGFfYV9zZWwKPgo+IMKgIMKgIGRzcGFfYV9kaXYKPgo+IMKgIMKgIGRzcGFfYQo+Cj4gwqAg
wqAgZHNwYV9iX3NlbAo+Cj4gwqAgwqAgZHNwYV9iX2Rpdgo+Cj4gwqAgwqAgZHNwYV9iCj4KPiDC
oCDCoCBkc3BiX2Ffc2VsCj4KPiDCoCDCoCBkc3BiX2FfZGl2Cj4KPiDCoCDCoCBkc3BiX2EKPgo+
IMKgIMKgIGRzcGJfYl9zZWwKPgo+IMKgIMKgIGRzcGJfYl9kaXYKPgo+IMKgIMKgIGRzcGJfYgo+
Cj4KPiBhbmFraW4gY2xvY2tzIGFyZToKPgo+IMKgIMKgIGFuYWtpbl9hX3NlbAo+Cj4gwqAgwqAg
YW5ha2luX2FfZGl2Cj4KPiDCoCDCoCBhbmFraW5fYQo+Cj4gwqAgwqAgYW5ha2luX2Jfc2VsCj4K
PiDCoCDCoCBhbmFraW5fYl9kaXYKPgo+IMKgIMKgIGFuYWtpbl9iCj4KPiDCoCDCoCBhbmFraW5f
YWJfc2VsCj4KPiDCoCDCoCBhbmFraW4KPgo+Cj4gV2hpY2ggb25lIGlzIGJldHRlcj8KCmEvYiBv
ciAwLzEsIHdlIGFscmVhZHkgaGF2ZSBib3RoCgpQaWNrIHdoaWNoIGV2ZXIgc2NoZW1lIHlvdSBw
cmVmZXIsIGp1c3Qgc3RpY2sgdG8gaXQgZnJvbSBub3cgb24uCgo+Cj4+Pj4+ICsgICAgIC5kYXRh
ID0gJihzdHJ1Y3QgY2xrX3JlZ21hcF9nYXRlX2RhdGEpewo+Pj4+PiArICAgICAgICAgICAgIC5v
ZmZzZXQgPSBBTkFLSU5fQ0xLX0NUUkwsCj4+Pj4+ICsgICAgICAgICAgICAgLmJpdF9pZHggPSA4
LAo+Pj4+PiArICAgICB9LAo+Pj4+PiArICAgICAuaHcuaW5pdCA9ICYoc3RydWN0IGNsa19pbml0
X2RhdGEpIHsKPj4+Pj4gKyAgICAgICAgICAgICAubmFtZSA9ICJhbmFraW5fMCIsCj4+Pj4+ICsg
ICAgICAgICAgICAgLm9wcyA9ICZjbGtfcmVnbWFwX2dhdGVfb3BzLAo+Pj4+PiArICAgICAgICAg
ICAgIC5wYXJlbnRfaHdzID0gKGNvbnN0IHN0cnVjdCBjbGtfaHcgKltdKSB7ICZ0N19hbmFraW5f
MF9kaXYuaHcgfSwKPj4+Pj4gKyAgICAgICAgICAgICAubnVtX3BhcmVudHMgPSAxLAo+Pj4+PiAr
ICAgICAgICAgICAgIC5mbGFncyA9IENMS19TRVRfUkFURV9HQVRFIHwgQ0xLX1NFVF9SQVRFX1BB
UkVOVCwKPj4+Pj4gKyAgICAgfSwKPj4+Pj4gK307Cj4+IFsuLi5dCj4+Cj4+Pj4+ICsKPj4+Pj4g
K3N0YXRpYyBzdHJ1Y3QgY2xrX3JlZ21hcCB0N19hbmFraW5fY2xrID0gewo+Pj4+PiArICAgICAu
ZGF0YSA9ICYoc3RydWN0IGNsa19yZWdtYXBfZ2F0ZV9kYXRhKXsKPj4+Pj4gKyAgICAgICAgICAg
ICAub2Zmc2V0ID0gQU5BS0lOX0NMS19DVFJMLAo+Pj4+PiArICAgICAgICAgICAgIC5iaXRfaWR4
ID0gMzAsCj4+Pj4+ICsgICAgIH0sCj4+Pj4+ICsgICAgIC5ody5pbml0ID0gJihzdHJ1Y3QgY2xr
X2luaXRfZGF0YSkgewo+Pj4+PiArICAgICAgICAgICAgIC5uYW1lID0gImFuYWtpbl9jbGsiLAo+
Pj4+IEFnYWluLCBub3QgYSBncmVhdCBuYW1lLCBlc3BlY2lhbGx5IGNvbnNpZGVyaW5nIHRoZSBv
bmUgYWJvdmUuCj4+Pj4gSXMgdGhpcyByZWFsbHkgcmVhbGx5IGhvdyB0aGUgZG9jIHJlZmVycyB0
byB0aGVzZSAyIGNsb2NrcyA/Cj4+Pgo+Pj4gYml0MzAgZ2F0ZSBjbG9jayBpcyBhZnRlciBiaXQz
MSBtdXggY2xvY2ssICBhbmQgdGhlIGdhdGUgY2xvY2sgaXMgdGhlIGZpbmFsCj4+PiBvdXRwdXQg
Y2xvY2ssIGl0IGlzIHVzZWQgdG8gZ2F0ZSBhbmFraW4gY2xvY2suCj4+Pgo+Pj4gSSB3aWxsIHJl
bmFtZSBiaXQzMSBhcyBhbmFraW5fcHJlLCByZW5hbWUgYml0MzAgYXMgYW5ha2luLgo+PiBPayBm
b3IgdGhlIGxhc3QgZWxlbWVudAo+Pgo+PiAuLi4gYnV0IEkgZG9uJ3QgIGxpa2UgIl9wcmUiIGZv
ciBhIG11eCBzZWxlY3Rpbmcgb25lIHRoZSAyIGdsaXRjaCBmcmVlCj4+IHBhdGguIEl0IGRvZXMg
bm90IGhlbHAgdW5kZXJzdGFuZGluZyB0aGUgdHJlZS4KPj4KPj4gRm9yIHN1Y2ggbXV4LCB3aGVu
IGl0IGlzIG5vdCB0aGUgbGFzdCBlbGVtZW50LCBJIHdvdWxkIHN1Z2dlc3QKPj4gIl9hYl9zZWwi
IC4uLiBhdCBsZWFzdCBpdCBpcyBjbGVhciB3aGF0IGl0IGRvZXMgc28sICJhbmFraW5fYWJfc2Vs
IiA/Cj4+Cj4KPiBvaywgYW5ha2luX2FiX3NlbCBhbmQgYW5ha2luIGZvciB0aGVzZSB0d28gY2xv
Y2tzLgo+Cj4KPiBNYXliZSBhbmFraW5fMDFfc2VsIGFuZCBhbmFraW4gZm9yIHRoZXNlIHR3byBj
bG9ja3MsIGlmIHlvdSBhZ3JlZSB0byAwLzEKPiBuYW1pbmcgY29udmVudGlvbi4KPgo+Pj4+PiAr
ICAgICAgICAgICAgIC5vcHMgPSAmY2xrX3JlZ21hcF9nYXRlX29wcywKPj4+Pj4gKyAgICAgICAg
ICAgICAucGFyZW50X2h3cyA9IChjb25zdCBzdHJ1Y3QgY2xrX2h3ICpbXSkgewo+Pj4+PiArICAg
ICAgICAgICAgICAgICAgICAgJnQ3X2FuYWtpbi5odwo+Pj4+PiArICAgICAgICAgICAgIH0sCj4+
Pj4+ICsgICAgICAgICAgICAgLm51bV9wYXJlbnRzID0gMSwKPj4+Pj4gKyAgICAgICAgICAgICAu
ZmxhZ3MgPSBDTEtfU0VUX1JBVEVfUEFSRU5UCj4+Pj4+ICsgICAgIH0sCj4+Pj4+ICt9Owo+Pj4+
PiArCgotLSAKSmVyb21lCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1hbWxvZ2ljCg==
