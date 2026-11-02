Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3FF606A330
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 Nov 2026 08:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=O7eDEIDO;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=aBHI8Bti;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=WaP6N4P6;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=aBHI8Bti;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=WaP6N4P6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=cm4ApdX6JgrGL7q5Dtu178E7PPjA6japoZwth5QNq7s=; b=O7eDEIDOooysB4H0OPQsj58MSh
	ST2lyFmKb78sCruYJj9qkNxgRZXsb2YcbvduSd3eDnW79kZftoFqOs3QSIKB6G7RLBhj4NDiLpTCz
	6bDhhZbiAA8bpSEtzkrj+C1Wuo4gIcPnxTmA/RTypOdmESgnGZoRcJ0q69GiaVRsoASEcBhaNKNrj
	hyfoMJDMCG1tgzS/mfeYjTHsH0hC0tDdzA/IQrKPJ0ULyY3hlvE9s4JA+VjdRcgbARqgzk1jWqyor
	doAxLYPgkYGo6cHqCobRh2NZwn8yFsaRu8d34EVCTfcaxLYAxWGNlwGExVkjY3mHMZcvbny8M5YPa
	kXzEsoXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNnc7-0000000FtQX-2tTu;
	Mon, 02 Nov 2026 08:41:59 +0000
Received: from smtp-out1.suse.de ([195.135.223.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNnc4-0000000FtQ0-3CR8
	for linux-amlogic@lists.infradead.org;
	Mon, 02 Nov 2026 08:41:58 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 43FAA21F6F;
	Mon,  2 Nov 2026 08:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793608913; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=sLYkZIlajO1RP3a6/sXxM1cwXGCi+Yc63O36rVdHkD0=;
	b=aBHI8Btiv2V3lT1hpQtokRDGhdybXDJ+aalt2MnUuifid0+1yWbNYl3Sk5zpiUWOfb4p6s
	/BBwCLsmjoi1CFs4iy2HYZ8PWTOqb6YcHB6oZzyYxGWINLaTuxfE7K66nU211Dd2+IhWQ5
	kggYNi/7lZnxxzCvHFyn7Vsz/AJxp60=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793608913;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=sLYkZIlajO1RP3a6/sXxM1cwXGCi+Yc63O36rVdHkD0=;
	b=WaP6N4P6oJzoz4X6ExjjjCP40XnZNhue3dENmIYeXKi8fhZ9mEtwTr+oyw/yj0dUPU5Bdi
	+OGUUhPDzruR08CA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793608913; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=sLYkZIlajO1RP3a6/sXxM1cwXGCi+Yc63O36rVdHkD0=;
	b=aBHI8Btiv2V3lT1hpQtokRDGhdybXDJ+aalt2MnUuifid0+1yWbNYl3Sk5zpiUWOfb4p6s
	/BBwCLsmjoi1CFs4iy2HYZ8PWTOqb6YcHB6oZzyYxGWINLaTuxfE7K66nU211Dd2+IhWQ5
	kggYNi/7lZnxxzCvHFyn7Vsz/AJxp60=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793608913;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=sLYkZIlajO1RP3a6/sXxM1cwXGCi+Yc63O36rVdHkD0=;
	b=WaP6N4P6oJzoz4X6ExjjjCP40XnZNhue3dENmIYeXKi8fhZ9mEtwTr+oyw/yj0dUPU5Bdi
	+OGUUhPDzruR08CA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7B050134B8;
	Mon,  2 Nov 2026 08:41:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id fYQYCs9M6Gq2PwAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Mon, 02 Nov 2026 08:41:51 +0000
Message-ID: <aa7ea691-03ec-44b0-85fb-9927f3b4a32b@suse.de>
Date: Mon, 2 Nov 2026 09:41:50 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/37] drm/connector: Convert all drivers to
 atomic_create_state and remove reset
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 Russell King <linux@armlinux.org.uk>, Alim Akhtar <alim.akhtar@samsung.com>,
 Inki Dae <inki.dae@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, linux-samsung-soc@vger.kernel.org,
 Alison Wang <alison.wang@nxp.com>, Stefan Agner <stefan@agner.ch>,
 Huacai Chen <chenhuacai@kernel.org>, Icenowy Zheng
 <zhengxingda@iscas.ac.cn>, Jianmin Lv <lvjianmin@loongson.cn>,
 Mingcong Bai <jeffbai@aosc.io>, Qianhai Wu <wuqianhai@loongson.cn>,
 Xi Ruoyao <xry111@xry111.site>, Geert Uytterhoeven
 <geert+renesas@glider.be>, linux-renesas-soc@vger.kernel.org,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Raphael Gallais-Pou <rgallaispou@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Thierry Reding <thierry.reding@kernel.org>, linux-tegra@vger.kernel.org,
 Alexey Brodkin <abrodkin@synopsys.com>, Alex Lanzano
 <lanzano.alex@gmail.com>, Chia-I Wu <olvaffe@gmail.com>,
 David Airlie <airlied@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 virtualization@lists.linux.dev, Haneen Mohammed <hamohammed.sa@gmail.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Danilo Krummrich <dakr@kernel.org>,
 Lyude Paul <lyude@redhat.com>, nouveau@lists.freedesktop.org
References: <20261030-drm-no-more-connector-reset-v3-0-30e71d92c327@kernel.org>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <20261030-drm-no-more-connector-reset-v3-0-30e71d92c327@kernel.org>
X-Spam-Level: 
X-Spamd-Result: default: False [-11.79 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	TAGGED_RCPT(0.00)[renesas];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,gmail.com,ffwll.ch];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,amd.com,armlinux.org.uk,samsung.com,kernel.org,linaro.org,vger.kernel.org,nxp.com,agner.ch,iscas.ac.cn,loongson.cn,aosc.io,xry111.site,glider.be,gmail.com,foss.st.com,sholland.org,lists.linux.dev,nvidia.com,synopsys.com,redhat.com,collabora.com,chromium.org,bootlin.com,epam.com,baylibre.com,googlemail.com,lists.infradead.org,igalia.com,linux.intel.com,intel.com,ursulin.net];
	R_RATELIMIT(0.00)[to_ip_from(RL6e75e7xiqh135443e1d3zo16)];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_GT_50(0.00)[64];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:url,suse.de:email]
X-Spam-Score: -11.79
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_004157_109551_D5C0F3D7 
X-CRM114-Status: GOOD (  19.89  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgTWF4aW1lCgpBbSAzMC4xMC4yNiB1bSAxNjoxMyBzY2hyaWViIE1heGltZSBSaXBhcmQ6Cj4g
VGhpcyBpcyBhIGZvbGxvdy11cCB0byB0aGUgcGxhbmUgYW5kIENSVEMgcmVzZXQgcmVtb3ZhbCBz
ZXJpZXMsIGFuZAo+IHBhcnQgb2YgYSBsYXJnZXIgZWZmb3J0IHRvIHJlbW92ZSB0aGUgcmVzZXQg
aG9vayBmcm9tIGFsbCBLTVMgb2JqZWN0cy4KPgo+IFRoZSBjb25uZWN0b3IgcmVzZXQgaG9vayBp
cyBvdmVybG9hZGVkOiBpdCBpcyBjYWxsZWQgYm90aCBhdCBwcm9iZQo+IHRpbWUgdG8gY3JlYXRl
IHRoZSBpbml0aWFsIHNvZnR3YXJlIHN0YXRlIGFuZCBkdXJpbmcgc3VzcGVuZC9yZXN1bWUgdG8K
PiByZXNldCBoYXJkd2FyZSBhbmQgc29mdHdhcmUgc3RhdGUuIFRoZXNlIHR3byByb2xlcyBoYXZl
IGRpZmZlcmVudAo+IHJlcXVpcmVtZW50cywgYW5kIHRoZSByZXNldCBob29rIGlzIG5vdCBmYWxs
aWJsZSwgbWFraW5nIGVycm9yCj4gaGFuZGxpbmcgZGlmZmljdWx0IGZvciB0aGUgaW5pdGlhbCBz
dGF0ZSBhbGxvY2F0aW9uIHBhdGguCj4KPiBXaGlsZSByZXNldCBoYXMgdGhlIHNlbWFudGljcyB0
byByZXNldCBib3RoIHRoZSBzb2Z0d2FyZSBhbmQgaGFyZHdhcmUKPiBzdGF0ZSwgdGhlIHZhc3Qg
bWFqb3JpdHkgb2YgaW1wbGVtZW50YXRpb25zIGFuZCBhbGwgdGhlIGhlbHBlcnMgb25seQo+IHJl
c2V0IHRoZSBzb2Z0d2FyZSBzdGF0ZSwgbWFraW5nIHRoZW0gZXF1aXZhbGVudCB0bwo+IGF0b21p
Y19jcmVhdGVfc3RhdGUgaW4gcHJhY3RpY2UuIFRoZSBhdG9taWNfY3JlYXRlX3N0YXRlIGhvb2sg
bWFrZXMKPiB0aGlzIGV4cGxpY2l0OiBpdCBvbmx5IGFsbG9jYXRlcyBhbmQgaW5pdGlhbGl6ZXMg
YSBwcmlzdGluZSBzdGF0ZQo+IHdpdGhvdXQgYW55IHNpZGUgZWZmZWN0LCBhbmQgcmV0dXJucyB0
aGUgc3RhdGUgcG9pbnRlciBvciBhbiBFUlJfUFRSCj4gb24gZmFpbHVyZS4KPgo+IFRoaXMgc2Vy
aWVzIGNvbnZlcnRzIGFsbCBjb25uZWN0b3IgZHJpdmVycyB0cmVlLXdpZGUgZnJvbSB0aGUgcmVz
ZXQgaG9vawo+IHRvIGF0b21pY19jcmVhdGVfc3RhdGUsIHRoZW4gcmVtb3ZlcyB0aGUgcmVzZXQg
aG9vayBmcm9tIHN0cnVjdAo+IGRybV9jb25uZWN0b3JfZnVuY3MgZW50aXJlbHkuIFRoZSBjb252
ZXJzaW9ucyB3ZXJlIGRvbmUgdXNpbmcgYQo+IGNvbWJpbmF0aW9uIG9mIENvY2NpbmVsbGUgc2Vt
YW50aWMgcGF0Y2hlcywgbWVjaGFuaWNhbCBvbmUtbGluZQo+IHJlcGxhY2VtZW50cyBhbmQgbWFu
dWFsIGFkanVzdG1lbnRzLgo+Cj4gU2lnbmVkLW9mZi1ieTogTWF4aW1lIFJpcGFyZCA8bXJpcGFy
ZEBrZXJuZWwub3JnPgoKUmV2aWV3ZWQtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFu
bkBzdXNlLmRlPgoKZm9yIHRoZSBlbnRpcmUgc2VyaWVzLgoKQmVzdCByZWdhcmRzClRob21hcwoK
Cj4gLS0tCj4gQ2hhbmdlcyBpbiB2MzoKPiAtIEZpeCBlcnJvciBwYXRoIGluIGR3LWhkbWkKPiAt
IEZpeCB0ZXN0IGVycm9yIHBhdGggZm9yIGFtZGdwdSBrdW5pdCB0ZXN0cwo+IC0gRml4IG5vdXZl
YXUgbGVnYWN5IHBhdGgKPiAtIExpbmsgdG8gdjI6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3Iv
MjAyNjEwMjItZHJtLW5vLW1vcmUtY29ubmVjdG9yLXJlc2V0LXYyLTAtMGI3ZTRlODViMWU4QGtl
cm5lbC5vcmcKPgo+IENoYW5nZXMgaW4gdjI6Cj4gLSBDaGFuZ2UgdGhlIHBhcmFtZXRlciBvcmRl
ciBvZiBfX2RybV9hdG9taWNfaGVscGVyX2Nvbm5lY3Rvcl9oZG1pX3N0YXRlX2luaXQKPiAtIEZp
eGVkIHN0YXRlIGFyZ3VtZW50IGNhc2luZyBmb3IgZHJtX2F0b21pY19oZWxwZXJfY29ubmVjdG9y
X3R2X21hcmdpbnNfc3RhdGVfaW5pdAo+ICAgIGFuZCBkcm1fYXRvbWljX2hlbHBlcl9jb25uZWN0
b3JfdHZfc3RhdGVfaW5pdAo+IC0gUHV0IGF0b21pY19jcmVhdGVfc3RhdGUgYmVmb3JlIGF0b21p
Y19kdXBsaWNhdGVfc3RhdGUKPiAtIEZpeCBzdGF0ZSBhbGxvY2F0aW9uIGZvciBNU1QgYW5kIFdC
IGNvbm5lY3RvcnMKPiAtIExpbmsgdG8gdjE6Cj4gICAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
ci8yMDI2MTAxNC1kcm0tbm8tbW9yZS1jb25uZWN0b3ItcmVzZXQtdjEtMC01ODZjOWMwMjY4MjNA
a2VybmVsLm9yZwo+Cj4gLS0tCj4gTWF4aW1lIFJpcGFyZCAoMzcpOgo+ICAgICAgICBkcm0vYW1k
Z3B1OiB2a21zOiBTd2l0Y2ggdG8gZHJtX2F0b21pY19oZWxwZXJfY29ubmVjdG9yX2NyZWF0ZV9z
dGF0ZQo+ICAgICAgICBkcm0vYnJpZGdlOiBhbmFsb2dpeC1hbng2MzQ1OiBTd2l0Y2ggdG8gZHJt
X2F0b21pY19oZWxwZXJfY29ubmVjdG9yX2NyZWF0ZV9zdGF0ZQo+ICAgICAgICBkcm0vYnJpZGdl
OiBhbmFsb2dpeC1hbng3OHh4OiBTd2l0Y2ggdG8gZHJtX2F0b21pY19oZWxwZXJfY29ubmVjdG9y
X2NyZWF0ZV9zdGF0ZQo+ICAgICAgICBkcm0vYnJpZGdlOiBjaHJvbnRlbC1jaDcwMzM6IFN3aXRj
aCB0byBkcm1fYXRvbWljX2hlbHBlcl9jb25uZWN0b3JfY3JlYXRlX3N0YXRlCj4gICAgICAgIGRy
bS9icmlkZ2U6IG54cC1wdG4zNDYwOiBTd2l0Y2ggdG8gZHJtX2F0b21pY19oZWxwZXJfY29ubmVj
dG9yX2NyZWF0ZV9zdGF0ZQo+ICAgICAgICBkcm0vcGFuZWw6IFN3aXRjaCB0byBkcm1fYXRvbWlj
X2hlbHBlcl9jb25uZWN0b3JfY3JlYXRlX3N0YXRlCj4gICAgICAgIGRybS9icmlkZ2U6IHN5bm9w
c3lzOiBkdy1oZG1pOiBTd2l0Y2ggdG8gZHJtX2F0b21pY19oZWxwZXJfY29ubmVjdG9yX2NyZWF0
ZV9zdGF0ZQo+ICAgICAgICBkcm0vYnJpZGdlOiB0YzM1ODc2NzogU3dpdGNoIHRvIGRybV9hdG9t
aWNfaGVscGVyX2Nvbm5lY3Rvcl9jcmVhdGVfc3RhdGUKPiAgICAgICAgZHJtL2JyaWRnZTogdGRh
OTk4eDogU3dpdGNoIHRvIGRybV9hdG9taWNfaGVscGVyX2Nvbm5lY3Rvcl9jcmVhdGVfc3RhdGUK
PiAgICAgICAgZHJtL2JyaWRnZTogdGktdGZwNDEwOiBTd2l0Y2ggdG8gZHJtX2F0b21pY19oZWxw
ZXJfY29ubmVjdG9yX2NyZWF0ZV9zdGF0ZQo+ICAgICAgICBkcm0vZXh5bm9zOiBTd2l0Y2ggdG8g
ZHJtX2F0b21pY19oZWxwZXJfY29ubmVjdG9yX2NyZWF0ZV9zdGF0ZQo+ICAgICAgICBkcm0vZnNs
LWRjdTogU3dpdGNoIHRvIGRybV9hdG9taWNfaGVscGVyX2Nvbm5lY3Rvcl9jcmVhdGVfc3RhdGUK
PiAgICAgICAgZHJtL2xvb25nc29uOiBTd2l0Y2ggdG8gZHJtX2F0b21pY19oZWxwZXJfY29ubmVj
dG9yX2NyZWF0ZV9zdGF0ZQo+ICAgICAgICBkcm0vbWlwaS1kYmk6IFN3aXRjaCB0byBkcm1fYXRv
bWljX2hlbHBlcl9jb25uZWN0b3JfY3JlYXRlX3N0YXRlCj4gICAgICAgIGRybS9yZW5lc2FzOiBz
aG1vYmlsZTogU3dpdGNoIHRvIGRybV9hdG9taWNfaGVscGVyX2Nvbm5lY3Rvcl9jcmVhdGVfc3Rh
dGUKPiAgICAgICAgZHJtL3NpdHJvbml4OiBzdDc1NzE6IFN3aXRjaCB0byBkcm1fYXRvbWljX2hl
bHBlcl9jb25uZWN0b3JfY3JlYXRlX3N0YXRlCj4gICAgICAgIGRybS9zdGk6IFN3aXRjaCB0byBk
cm1fYXRvbWljX2hlbHBlcl9jb25uZWN0b3JfY3JlYXRlX3N0YXRlCj4gICAgICAgIGRybS9zdW40
aTogU3dpdGNoIHRvIGRybV9hdG9taWNfaGVscGVyX2Nvbm5lY3Rvcl9jcmVhdGVfc3RhdGUKPiAg
ICAgICAgZHJtL3RlZ3JhOiBTd2l0Y2ggdG8gZHJtX2F0b21pY19oZWxwZXJfY29ubmVjdG9yX2Ny
ZWF0ZV9zdGF0ZQo+ICAgICAgICBkcm0vdGVzdHM6IFN3aXRjaCB0byBkcm1fYXRvbWljX2hlbHBl
cl9jb25uZWN0b3JfY3JlYXRlX3N0YXRlCj4gICAgICAgIGRybS90aW55OiBhcmNwZ3U6IFN3aXRj
aCB0byBkcm1fYXRvbWljX2hlbHBlcl9jb25uZWN0b3JfY3JlYXRlX3N0YXRlCj4gICAgICAgIGRy
bS90aW55OiBzaGFycDogU3dpdGNoIHRvIGRybV9hdG9taWNfaGVscGVyX2Nvbm5lY3Rvcl9jcmVh
dGVfc3RhdGUKPiAgICAgICAgZHJtL3ZpcnRpbzogU3dpdGNoIHRvIGRybV9hdG9taWNfaGVscGVy
X2Nvbm5lY3Rvcl9jcmVhdGVfc3RhdGUKPiAgICAgICAgZHJtL3ZrbXM6IFN3aXRjaCB0byBkcm1f
YXRvbWljX2hlbHBlcl9jb25uZWN0b3JfY3JlYXRlX3N0YXRlCj4gICAgICAgIGRybS94ZW46IFN3
aXRjaCB0byBkcm1fYXRvbWljX2hlbHBlcl9jb25uZWN0b3JfY3JlYXRlX3N0YXRlCj4gICAgICAg
IGRybS9icmlkZ2U6IHN5bm9wc3lzOiBkdy1oZG1pOiBDb252ZXJ0IHRvIGF0b21pY19jcmVhdGVf
c3RhdGUKPiAgICAgICAgZHJtL21lc29uOiBDb252ZXJ0IHRvIGF0b21pY19jcmVhdGVfc3RhdGUK
PiAgICAgICAgZHJtL3N1bjRpOiBoZG1pOiBDb252ZXJ0IHRvIGF0b21pY19jcmVhdGVfc3RhdGUK
PiAgICAgICAgZHJtL3N1bjRpOiB0djogQ29udmVydCB0byBhdG9taWNfY3JlYXRlX3N0YXRlCj4g
ICAgICAgIGRybS90ZXN0czogaGRtaTogQ29udmVydCB0byBhdG9taWNfY3JlYXRlX3N0YXRlCj4g
ICAgICAgIGRybS9jb25uZWN0b3I6IFJlbW92ZSBkcm1fYXRvbWljX2hlbHBlcl9jb25uZWN0b3Jf
cmVzZXQoKQo+ICAgICAgICBkcm0vYW1kZ3B1OiBkbTogQ29udmVydCB0byBhdG9taWNfY3JlYXRl
X3N0YXRlCj4gICAgICAgIGRybS9pOTE1OiBDb252ZXJ0IHRvIGF0b21pY19jcmVhdGVfc3RhdGUK
PiAgICAgICAgZHJtL25vdXZlYXU6IENvbnZlcnQgdG8gYXRvbWljX2NyZWF0ZV9zdGF0ZQo+ICAg
ICAgICBkcm0vdGVncmE6IENvbnZlcnQgdG8gYXRvbWljX2NyZWF0ZV9zdGF0ZQo+ICAgICAgICBk
cm0vY29ubmVjdG9yOiBSZW1vdmUgX19kcm1fYXRvbWljX2hlbHBlcl9jb25uZWN0b3JfcmVzZXQo
KQo+ICAgICAgICBkcm0vY29ubmVjdG9yOiBSZW1vdmUgcmVzZXQKPgo+ICAgZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZrbXMuYyAgICAgICAgICAgfCAgIDIgKy0KPiAgIC4uLi9h
bWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX2Nvbm5lY3Rvci5jICAgIHwgIDMyICsrLS0t
Cj4gICAuLi4vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9jb25uZWN0b3IuaCAgICB8
ICAgMyArLQo+ICAgLi4uL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fbXN0X3R5cGVz
LmMgICAgfCAgMTEgKy0KPiAgIC4uLi9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRn
cHVfZG1fd2IuYyAgIHwgIDE3ICsrLQo+ICAgLi4uL2FtZGdwdV9kbS90ZXN0cy9hbWRncHVfZG1f
Y29ubmVjdG9yX3Rlc3QuYyAgICAgfCAxMDIgKysrKysrKysrKystLS0tLQo+ICAgZHJpdmVycy9n
cHUvZHJtL2JyaWRnZS9hbmFsb2dpeC9hbmFsb2dpeC1hbng2MzQ1LmMgfCAgIDIgKy0KPiAgIGRy
aXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgvYW5hbG9naXgtYW54Nzh4eC5jIHwgICAyICst
Cj4gICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2Nocm9udGVsLWNoNzAzMy5jICAgICAgICAgICB8
ICAgMiArLQo+ICAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9ueHAtcHRuMzQ2MC5jICAgICAgICAg
ICAgICAgfCAgIDIgKy0KPiAgIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRt
aS5jICAgICAgICAgIHwgIDE0ICsrLQo+ICAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90YzM1ODc2
Ny5jICAgICAgICAgICAgICAgICAgfCAgIDIgKy0KPiAgIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uv
dGRhOTk4eF9kcnYuYyAgICAgICAgICAgICAgIHwgICAyICstCj4gICBkcml2ZXJzL2dwdS9kcm0v
YnJpZGdlL3RpLXRmcDQxMC5jICAgICAgICAgICAgICAgICB8ICAgMiArLQo+ICAgZHJpdmVycy9n
cHUvZHJtL2Rpc3BsYXkvZHJtX2hkbWlfc3RhdGVfaGVscGVyLmMgICAgfCAgIDMgKy0KPiAgIGRy
aXZlcnMvZ3B1L2RybS9kcm1fYXRvbWljX3N0YXRlX2hlbHBlci5jICAgICAgICAgIHwgIDQzIC0t
LS0tLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9kcm1fY29ubmVjdG9yLmMgICAgICAgICAgICAgICAg
ICAgIHwgICA4IC0tCj4gICBkcml2ZXJzL2dwdS9kcm0vZHJtX21vZGVfY29uZmlnLmMgICAgICAg
ICAgICAgICAgICB8ICAgNCArLQo+ICAgZHJpdmVycy9ncHUvZHJtL2RybV9wYW5lbC5jICAgICAg
ICAgICAgICAgICAgICAgICAgfCAgIDQgKy0KPiAgIGRyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5
bm9zX2RybV9kcGkuYyAgICAgICAgICAgIHwgICAyICstCj4gICBkcml2ZXJzL2dwdS9kcm0vZXh5
bm9zL2V4eW5vc19kcm1fdmlkaS5jICAgICAgICAgICB8ICAgMiArLQo+ICAgZHJpdmVycy9ncHUv
ZHJtL2V4eW5vcy9leHlub3NfaGRtaS5jICAgICAgICAgICAgICAgfCAgIDIgKy0KPiAgIGRyaXZl
cnMvZ3B1L2RybS9mc2wtZGN1L2ZzbF9kY3VfZHJtX3JnYi5jICAgICAgICAgIHwgICAyICstCj4g
ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Nvbm5lY3Rvci5jICAgICB8ICAg
NiArLQo+ICAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9zZHZvLmMgICAgICAg
ICAgfCAgIDYgKy0KPiAgIGRyaXZlcnMvZ3B1L2RybS9sb29uZ3Nvbi9sc2RjX291dHB1dF83YTEw
MDAuYyAgICAgIHwgICAyICstCj4gICBkcml2ZXJzL2dwdS9kcm0vbG9vbmdzb24vbHNkY19vdXRw
dXRfN2EyMDAwLmMgICAgICB8ICAgNCArLQo+ICAgZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29u
X2VuY29kZXJfaGRtaS5jICAgICAgICAgfCAgMTIgKy0KPiAgIGRyaXZlcnMvZ3B1L2RybS9ub3V2
ZWF1L2Rpc3BudjUwL2Rpc3AuYyAgICAgICAgICAgIHwgIDI1ICsrLS0KPiAgIGRyaXZlcnMvZ3B1
L2RybS9ub3V2ZWF1L25vdXZlYXVfY29ubmVjdG9yLmMgICAgICAgIHwgMTI5ICsrKysrKysrKysr
KysrKystLS0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9jb25uZWN0b3Iu
aCAgICAgICAgfCAgIDMgKy0KPiAgIGRyaXZlcnMvZ3B1L2RybS9yZW5lc2FzL3NobW9iaWxlL3No
bW9iX2RybV9jcnRjLmMgIHwgICAyICstCj4gICBkcml2ZXJzL2dwdS9kcm0vc2l0cm9uaXgvc3Q3
NTcxLmMgICAgICAgICAgICAgICAgICB8ICAgMiArLQo+ICAgZHJpdmVycy9ncHUvZHJtL3N0aS9z
dGlfZHZvLmMgICAgICAgICAgICAgICAgICAgICAgfCAgIDIgKy0KPiAgIGRyaXZlcnMvZ3B1L2Ry
bS9zdGkvc3RpX2hkYS5jICAgICAgICAgICAgICAgICAgICAgIHwgICAyICstCj4gICBkcml2ZXJz
L2dwdS9kcm0vc3RpL3N0aV9oZG1pLmMgICAgICAgICAgICAgICAgICAgICB8ICAgMiArLQo+ICAg
ZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjRpX2hkbWlfZW5jLmMgICAgICAgICAgICAgfCAgMTYg
KystCj4gICBkcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuNGlfbHZkcy5jICAgICAgICAgICAgICAg
ICB8ICAgMiArLQo+ICAgZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjRpX3JnYi5jICAgICAgICAg
ICAgICAgICAgfCAgIDIgKy0KPiAgIGRyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW40aV90di5jICAg
ICAgICAgICAgICAgICAgIHwgIDE2ICsrLQo+ICAgZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjZp
X21pcGlfZHNpLmMgICAgICAgICAgICAgfCAgIDIgKy0KPiAgIGRyaXZlcnMvZ3B1L2RybS90ZWdy
YS9kc2kuYyAgICAgICAgICAgICAgICAgICAgICAgIHwgIDE3ICsrLQo+ICAgZHJpdmVycy9ncHUv
ZHJtL3RlZ3JhL2hkbWkuYyAgICAgICAgICAgICAgICAgICAgICAgfCAgIDIgKy0KPiAgIGRyaXZl
cnMvZ3B1L2RybS90ZWdyYS9zb3IuYyAgICAgICAgICAgICAgICAgICAgICAgIHwgIDEzICstLQo+
ICAgZHJpdmVycy9ncHUvZHJtL3Rlc3RzL2RybV9hdG9taWNfY29tbWl0X3Rlc3QuYyAgICAgfCAg
IDIgKy0KPiAgIGRyaXZlcnMvZ3B1L2RybS90ZXN0cy9kcm1fYXRvbWljX3Rlc3QuYyAgICAgICAg
ICAgIHwgICAyICstCj4gICBkcml2ZXJzL2dwdS9kcm0vdGVzdHMvZHJtX2Nvbm5lY3Rvcl90ZXN0
LmMgICAgICAgICB8ICAgNCArLQo+ICAgZHJpdmVycy9ncHUvZHJtL3Rlc3RzL2RybV9oZG1pX3N0
YXRlX2hlbHBlcl90ZXN0LmMgfCAgMTYgKystCj4gICBkcml2ZXJzL2dwdS9kcm0vdGVzdHMvZHJt
X3Byb2JlX2hlbHBlcl90ZXN0LmMgICAgICB8ICAgMiArLQo+ICAgZHJpdmVycy9ncHUvZHJtL3Rp
bnkvYXJjcGd1LmMgICAgICAgICAgICAgICAgICAgICAgfCAgIDIgKy0KPiAgIGRyaXZlcnMvZ3B1
L2RybS90aW55L3NoYXJwLW1lbW9yeS5jICAgICAgICAgICAgICAgIHwgICAyICstCj4gICBkcml2
ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfZGlzcGxheS5jICAgICAgICAgICB8ICAgMiArLQo+
ICAgZHJpdmVycy9ncHUvZHJtL3ZrbXMvdmttc19jb25uZWN0b3IuYyAgICAgICAgICAgICAgfCAg
IDIgKy0KPiAgIGRyaXZlcnMvZ3B1L2RybS92a21zL3ZrbXNfd3JpdGViYWNrLmMgICAgICAgICAg
ICAgIHwgICAyICstCj4gICBkcml2ZXJzL2dwdS9kcm0veGVuL3hlbl9kcm1fZnJvbnRfY29ubi5j
ICAgICAgICAgICB8ICAgMiArLQo+ICAgaW5jbHVkZS9kcm0vZHJtX2F0b21pY19zdGF0ZV9oZWxw
ZXIuaCAgICAgICAgICAgICAgfCAgIDMgLQo+ICAgaW5jbHVkZS9kcm0vZHJtX2Nvbm5lY3Rvci5o
ICAgICAgICAgICAgICAgICAgICAgICAgfCAgMTIgLS0KPiAgIGluY2x1ZGUvZHJtL2RybV9taXBp
X2RiaS5oICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAyICstCj4gICA1OCBmaWxlcyBjaGFu
Z2VkLCAzNTEgaW5zZXJ0aW9ucygrKSwgMjM2IGRlbGV0aW9ucygtKQo+IC0tLQo+IGJhc2UtY29t
bWl0OiA5MWY1MmU5OTgyNGIwYmVlYmI0OGNhZDUxYmJkYTgxNDM3YWY4NjY0Cj4gY2hhbmdlLWlk
OiAyMDI2MDcwOS1kcm0tbm8tbW9yZS1jb25uZWN0b3ItcmVzZXQtNDVlZTE0ZDdjNjJjCj4KPiBC
ZXN0IHJlZ2FyZHMsCgotLSAKLS0KVGhvbWFzIFppbW1lcm1hbm4KR3JhcGhpY3MgRHJpdmVyIERl
dmVsb3BlcgpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgKRnJhbmtlbnN0ci4g
MTQ2LCA5MDQ2MSBOw7xybmJlcmcsIEdlcm1hbnksIHd3dy5zdXNlLmNvbQpHRjogU3RlZmFuIEdh
aXNlciwgSm9jaGVuIEphc2VyLCBBYmhpbmF2IFB1cmksIChIUkIgMzY4MDksIEFHIE7DvHJuYmVy
ZykKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dp
Ywo=
