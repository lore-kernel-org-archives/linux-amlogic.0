Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF350F459EF
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 Apr 2026 16:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qmwXsfYQICB41S6OuJwqBm5TO759M5ZUp6EZyeAB9JE=; b=vGEMwUhg80sEl9
	x2GrouFSJpq5WagHjXH6oe+iF0cUFhll6FuArNCuVq2rnk030Y65G248Ev75VAUPHK2SoHLTTv1xw
	PCQmSCxWCveUWsJhcAJeFzZy7HjJBTJNHI4fNCj8rrnijNZdEOjJBmMJL2P65e2gTjCh8+U15aPC/
	uQy7YIKABWs6qg+xuO5SWrtNP7BKt05uoDo/EnHSXMgFZLbkhTLOCBOSbl8uX85WHsjTvBKFWmzW9
	IPNmF/Z1jJ6j77sPYQ1el1K0C2mShx2+mweWVJsT4k2IawjYBM4F7gSH1VWc0Rg9h3RBQ6k6pXRt4
	wWxO+ZLBrg2uRhtM2Tkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBF2n-0000000CZ6N-1DAy;
	Fri, 10 Apr 2026 16:49:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBF2k-0000000CZ1U-1rpO;
	Fri, 10 Apr 2026 16:49:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=/xfAfRiou5rQEdVsQlWtPiOI3m6GZRMztNtx/4BabnY=; b=Uz83vIdA/wLgCnMvnrNuFw8DMQ
	tDrOB0kgMnmSLY9pQrF2uoYSZ8Ilwx5bxbTuKGQJmx6nSrA2ETWWbOE4qAW7Ow8DG0AlIlHGTvdNd
	Ha6jIix5YHGLDHUZXTFL8TCPJF5ej5h/WX3kewk1FCSTjMzpQj5zTj0PKRMnDV0HILvhQcqtE1Clv
	auksuvpGZJClpTnwE02yJCD5wTjFn+dUv0kJyNcUvkFGfOd/KLP1oNRqfHvcwUzLjsIamcy2PNDpp
	RNTZ9FXIB+AZt7C9WkG5GIARMwJ6aJVagzatwou+ThgdiOUPIJ5dL4bHi56/9ZeeWNxqFJii2UXA8
	RqrZNFug==;
Received: from courrier.aliel.fr ([2a01:4f9:c011:1c83::1])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBF2g-0000000DwdN-2B5N;
	Fri, 10 Apr 2026 16:49:17 +0000
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1775839740;
	bh=zbgRfmKb31HDgkan9Fy8S+p1BOUmWfaoe9tmTB9hGac=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=V8cYyD9bEpwmmkTC/R7Qz5FjheScvjl8nZ5M8pQ41u89djP5EFMB8CTdxr004BJzm
	 N70SjO/+XSlnZQ5g3u+y70Puhe46UGJWDTDsn99BXyRXS9y4GDpSEYoAF8DSUnrTsJ
	 vTR+2xxzZQKCX9tDDf11eygThjC1pcZepzqs8tOw=
Date: Fri, 10 Apr 2026 18:48:09 +0200
Subject: [PATCH 8/8] arm64: dts: amlogic: t7: khadas-vim4: Add fan cooling
 to thermal zones
MIME-Version: 1.0
Message-Id: <20260410-add-thermal-t7-vim4-v1-8-19f2b8da74d7@aliel.fr>
References: <20260410-add-thermal-t7-vim4-v1-0-19f2b8da74d7@aliel.fr>
In-Reply-To: <20260410-add-thermal-t7-vim4-v1-0-19f2b8da74d7@aliel.fr>
To: Guillaume La Roque <glaroque@baylibre.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-pm@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openssh-sha256; t=1775839732; l=2874;
 i=linux-kernel-dev@aliel.fr; s=id_ed25519; h=from:subject:message-id;
 bh=zbgRfmKb31HDgkan9Fy8S+p1BOUmWfaoe9tmTB9hGac=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgMGec55oxeeisqykQiUedekMYyOnR9
 BG9E/7rDWyqdNoAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QC2gP6l2ZGwBwfkdmnqHoopj7P0pXQieYHCsQz4S7Isj+ycLZJpj4jxyYI8NLM4ceXReP/Ntm/y
 vy0wj2kaYsQY=
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openssh;
 fpr=SHA256:kch4osYZ6A1BrPps5AUs6KnfdE2wm4ocMtyTc8TmZMs
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_174914_660997_965A6166 
X-CRM114-Status: UNSURE (   8.34  )
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

QWRkIGFuIGFjdGl2ZSB0cmlwIGF0IDUwwrBDIHRvIGFsbCBzaXggdGhlcm1hbCB6b25lcyBhbmQg
bWFwIGl0IHRvIHRoZQpraGFkYXNfbWN1IGZhbiBjb250cm9sbGVyLCB1c2luZyBjb29saW5nIHN0
YXRlcyAzMCB0byAxMDAuCgpTaWduZWQtb2ZmLWJ5OiBSb25hbGQgQ2xhdmVhdSA8bGludXgta2Vy
bmVsLWRldkBhbGllbC5mcj4KLS0tCiAuLi4vZHRzL2FtbG9naWMvYW1sb2dpYy10Ny1hMzExZDIt
a2hhZGFzLXZpbTQuZHRzICB8IDEwMiArKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFu
Z2VkLCAxMDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMv
YW1sb2dpYy9hbWxvZ2ljLXQ3LWEzMTFkMi1raGFkYXMtdmltNC5kdHMgYi9hcmNoL2FybTY0L2Jv
b3QvZHRzL2FtbG9naWMvYW1sb2dpYy10Ny1hMzExZDIta2hhZGFzLXZpbTQuZHRzCmluZGV4IDVk
N2Y1MzkwZjNhNjYuLmJhOTIxOTA3M2RkMGEgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtNjQvYm9vdC9k
dHMvYW1sb2dpYy9hbWxvZ2ljLXQ3LWEzMTFkMi1raGFkYXMtdmltNC5kdHMKKysrIGIvYXJjaC9h
cm02NC9ib290L2R0cy9hbWxvZ2ljL2FtbG9naWMtdDctYTMxMWQyLWtoYWRhcy12aW00LmR0cwpA
QCAtMTU3LDYgKzE1Nyw3NCBAQCB3aWZpMzJrOiB3aWZpMzJrIHsKIAl9OwogfTsKIAorJmE1M190
aGVybWFsIHsKKwl0cmlwcyB7CisJCWE1M19hY3RpdmU6IGE1My1hY3RpdmUgeworCQkJdGVtcGVy
YXR1cmUgPSA8NTAwMDA+OyAvKiBtaWxsaWNlbHNpdXMgKi8KKwkJCWh5c3RlcmVzaXMgPSA8MjAw
MD47IC8qIG1pbGxpY2Vsc2l1cyAqLworCQkJdHlwZSA9ICJhY3RpdmUiOworCQl9OworCX07CisK
Kwljb29saW5nLW1hcHMgeworCQltYXAgeworCQkJdHJpcCA9IDwmYTUzX2FjdGl2ZT47CisJCQlj
b29saW5nLWRldmljZSA9IDwma2hhZGFzX21jdSAzMCAxMDA+OworCQl9OworCX07Cit9OworCism
YTczX3RoZXJtYWwgeworCXRyaXBzIHsKKwkJYTczX2FjdGl2ZTogYTczLWFjdGl2ZSB7CisJCQl0
ZW1wZXJhdHVyZSA9IDw1MDAwMD47IC8qIG1pbGxpY2Vsc2l1cyAqLworCQkJaHlzdGVyZXNpcyA9
IDwyMDAwPjsgLyogbWlsbGljZWxzaXVzICovCisJCQl0eXBlID0gImFjdGl2ZSI7CisJCX07CisJ
fTsKKworCWNvb2xpbmctbWFwcyB7CisJCW1hcCB7CisJCQl0cmlwID0gPCZhNzNfYWN0aXZlPjsK
KwkJCWNvb2xpbmctZGV2aWNlID0gPCZraGFkYXNfbWN1IDMwIDEwMD47CisJCX07CisJfTsKK307
CisKKyZncHVfdGhlcm1hbCB7CisJdHJpcHMgeworCQlncHVfYWN0aXZlOiBncHUtYWN0aXZlIHsK
KwkJCXRlbXBlcmF0dXJlID0gPDUwMDAwPjsgLyogbWlsbGljZWxzaXVzICovCisJCQloeXN0ZXJl
c2lzID0gPDIwMDA+OyAvKiBtaWxsaWNlbHNpdXMgKi8KKwkJCXR5cGUgPSAiYWN0aXZlIjsKKwkJ
fTsKKwl9OworCisJY29vbGluZy1tYXBzIHsKKwkJbWFwIHsKKwkJCXRyaXAgPSA8JmdwdV9hY3Rp
dmU+OworCQkJY29vbGluZy1kZXZpY2UgPSA8JmtoYWRhc19tY3UgMzAgMTAwPjsKKwkJfTsKKwl9
OworfTsKKworJmhldmNfdGhlcm1hbCB7CisJdHJpcHMgeworCQloZXZjX2FjdGl2ZTogaGV2Yy1h
Y3RpdmUgeworCQkJdGVtcGVyYXR1cmUgPSA8NTAwMDA+OyAvKiBtaWxsaWNlbHNpdXMgKi8KKwkJ
CWh5c3RlcmVzaXMgPSA8MjAwMD47IC8qIG1pbGxpY2Vsc2l1cyAqLworCQkJdHlwZSA9ICJhY3Rp
dmUiOworCQl9OworCX07CisKKwljb29saW5nLW1hcHMgeworCQltYXAgeworCQkJdHJpcCA9IDwm
aGV2Y19hY3RpdmU+OworCQkJY29vbGluZy1kZXZpY2UgPSA8JmtoYWRhc19tY3UgMzAgMTAwPjsK
KwkJfTsKKwl9OworfTsKKwogJmkyY19tX2FvX2EgewogCXN0YXR1cyA9ICJva2F5IjsKIAlwaW5j
dHJsLTAgPSA8JmkyYzBfYW9fZF9waW5zPjsKQEAgLTE3MCw2ICsyMzgsMjMgQEAga2hhZGFzX21j
dTogc3lzdGVtLWNvbnRyb2xsZXJAMTggewogCX07CiB9OwogCismbm5hX3RoZXJtYWwgeworCXRy
aXBzIHsKKwkJbm5hX2FjdGl2ZTogbm5hLWFjdGl2ZSB7CisJCQl0ZW1wZXJhdHVyZSA9IDw1MDAw
MD47IC8qIG1pbGxpY2Vsc2l1cyAqLworCQkJaHlzdGVyZXNpcyA9IDwyMDAwPjsgLyogbWlsbGlj
ZWxzaXVzICovCisJCQl0eXBlID0gImFjdGl2ZSI7CisJCX07CisJfTsKKworCWNvb2xpbmctbWFw
cyB7CisJCW1hcCB7CisJCQl0cmlwID0gPCZubmFfYWN0aXZlPjsKKwkJCWNvb2xpbmctZGV2aWNl
ID0gPCZraGFkYXNfbWN1IDMwIDEwMD47CisJCX07CisJfTsKK307CisKICZwd21fYWIgewogCXN0
YXR1cyA9ICJva2F5IjsKIAlwaW5jdHJsLTAgPSA8JnB3bV9hX3BpbnM+OwpAQCAtMjY2LDMgKzM1
MSwyMCBAQCAmdWFydF9hIHsKIAljbG9ja3MgPSA8Jnh0YWw+LCA8Jnh0YWw+LCA8Jnh0YWw+Owog
CWNsb2NrLW5hbWVzID0gInh0YWwiLCAicGNsayIsICJiYXVkIjsKIH07CisKKyZ2cHVfdGhlcm1h
bCB7CisJdHJpcHMgeworCQl2cHVfYWN0aXZlOiB2cHUtYWN0aXZlIHsKKwkJCXRlbXBlcmF0dXJl
ID0gPDUwMDAwPjsgLyogbWlsbGljZWxzaXVzICovCisJCQloeXN0ZXJlc2lzID0gPDIwMDA+OyAv
KiBtaWxsaWNlbHNpdXMgKi8KKwkJCXR5cGUgPSAiYWN0aXZlIjsKKwkJfTsKKwl9OworCisJY29v
bGluZy1tYXBzIHsKKwkJbWFwIHsKKwkJCXRyaXAgPSA8JnZwdV9hY3RpdmU+OworCQkJY29vbGlu
Zy1kZXZpY2UgPSA8JmtoYWRhc19tY3UgMzAgMTAwPjsKKwkJfTsKKwl9OworfTsKCi0tIAoyLjQ5
LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2lj
Cg==
